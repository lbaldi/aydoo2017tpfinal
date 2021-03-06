require 'json'
require 'sinatra'

require_relative 'model/archivador_repositorio'
require_relative 'model/repositorio_calendarios'
require_relative 'model/calendario'
require_relative 'model/evento'
require_relative 'model/evento_recurrente'
require_relative 'model/frecuencia_diaria'
require_relative 'model/frecuencia_semanal'
require_relative 'model/frecuencia_mensual'
require_relative 'model/frecuencia_anual'
require_relative 'model/validador_unicidad_evento'

frecuencias = {
  "diaria" => FrecuenciaDiaria.new,
  "semanal" => FrecuenciaSemanal.new,
  "mensual" => FrecuenciaMensual.new,
  "anual" => FrecuenciaAnual.new
}

repositorio_calendarios = ArchivadorRepositorio.cargar || RepositorioCalendarios.new

post '/calendarios' do
  begin
    request.body.rewind
    body = JSON.parse request.body.read
    nombre_calendario = body['nombre']
    calendario = Calendario.new(nombre_calendario)
    repositorio_calendarios.almacenar_calendario(calendario)
    ArchivadorRepositorio.guardar(repositorio_calendarios)
    JSON.pretty_generate(calendario.to_h)
  rescue  ExcepcionUnicidadCalendario,
          ExcepcionNombreCalendario
    status 400
  end
end

delete '/calendarios/:nombre' do
  begin
    nombre_calendario = params[:nombre]
    repositorio_calendarios.eliminar_calendario(nombre_calendario)
    ArchivadorRepositorio.guardar(repositorio_calendarios)
  rescue ExcepcionCalendarioInexistente
    status 404
  end
end

get '/calendarios' do
  salida = []
  repositorio_calendarios.calendarios.values.each {|calendario| salida << calendario.to_h}
  JSON.pretty_generate(salida)
end

get '/calendarios/:nombre' do
  begin
    nombre_calendario = params[:nombre]
    calendario = repositorio_calendarios.obtener_calendario(nombre_calendario)
    JSON.pretty_generate(calendario.to_h)
  rescue ExcepcionCalendarioInexistente
    status 404
  end
end

post '/eventos' do
  begin
    request.body.rewind
    body = JSON.parse request.body.read
    id_evento = body['id']
    nombre_evento = body['nombre']
    inicio_evento = DateTime.parse(body['inicio'])
    fin_evento = DateTime.parse(body['fin'])
    nombre_calendario = body['calendario']
    calendario = repositorio_calendarios.obtener_calendario(nombre_calendario)
    if body.key?('recurrencia')
      frecuencia_evento = body['recurrencia']['frecuencia']
      frecuencia = frecuencias[frecuencia_evento]
      fin_recurrencia_evento = DateTime.parse(body['recurrencia']['fin'])
      evento = EventoRecurrente.new(
        id_evento,
        nombre_evento,
        inicio_evento,
        fin_evento,
        frecuencia,
        fin_recurrencia_evento
      )
    else
      evento = Evento.new(
        id_evento,
        nombre_evento,
        inicio_evento,
        fin_evento
      )
    end
    ValidadorUnicidadEvento.validar(repositorio_calendarios, evento.id)
    calendario.almacenar_evento(evento)
    ArchivadorRepositorio.guardar(repositorio_calendarios)
  rescue  ExcepcionCalendarioInexistente,
          ExcepcionIntervaloErroneo,
          ExcepcionIntervaloMaximo,
          ExcepcionUnicidadEvento,
          ExcepcionSolapamientoEvento,
          ExcepcionUnicidadGlobalEvento
    status 400
  end
end

put '/eventos' do
  begin
    request.body.rewind
    body = JSON.parse request.body.read
    id_evento = body['id']

    repositorio_evento = nil
    repositorio_calendarios.calendarios.values.each do |calendario|
      repositorio_evento = calendario if calendario.eventos.key?(id_evento)
      repositorio_evento && break
    end
    raise ExcepcionEventoInexistente unless repositorio_evento

    evento_original = repositorio_evento.obtener_evento(id_evento)
    nombre_original = evento_original.nombre
    inicio_original = evento_original.inicio
    fin_original = evento_original.fin
    frecuencia_original = evento_original.instance_variable_defined?(:@frecuencia) && evento_original.frecuencia
    fin_recurrencia_original = evento_original.instance_variable_defined?(:@fin_recurrencia) && evento_original.fin_recurrencia

    nombre_evento = body.key?('nombre') ? body['nombre'] : nombre_original
    inicio_evento = body.key?('inicio') ? DateTime.parse(body['inicio']) : inicio_original
    fin_evento = body.key?('fin') ? DateTime.parse(body['fin']) : fin_original

    frecuencia_evento = body.key?('recurrencia') && body['recurrencia'].key?('frecuencia') ? frecuencias[body['recurrencia']['frecuencia']] : frecuencia_original
    fin_recurrencia = body.key?('recurrencia') && body['recurrencia'].key?('fin') ? DateTime.parse(body['recurrencia']['fin']) : fin_recurrencia_original

    if frecuencia_evento && fin_recurrencia
      evento_reemplazante = EventoRecurrente.new(
        id_evento,
        nombre_evento,
        inicio_evento,
        fin_evento,
        frecuencia_evento,
        fin_recurrencia
      )
    else
      evento_reemplazante = Evento.new(
          id_evento,
          nombre_evento,
          inicio_evento,
          fin_evento
      )
    end
    repositorio_evento.eliminar_evento(id_evento)
    begin
      repositorio_evento.almacenar_evento(evento_reemplazante)
    rescue
      repositorio_evento.almacenar_evento(evento_original)
      status 400
    end
    ArchivadorRepositorio.guardar(repositorio_calendarios)

  rescue  ExcepcionCalendarioInexistente,
          ExcepcionEventoInexistente,
          ExcepcionIntervaloErroneo,
          ExcepcionIntervaloMaximo,
          ExcepcionSolapamientoEvento
    status 400
  end
end

delete '/eventos/:id' do
  id_evento = params[:id]
  repositorio_evento = nil
  repositorio_calendarios.calendarios.values.each do |calendario|
    repositorio_evento = calendario if calendario.eventos.key?(id_evento)
    repositorio_evento && break
  end
  begin
    repositorio_evento.eliminar_evento(id_evento)
    ArchivadorRepositorio.guardar(repositorio_calendarios)
  rescue
    status 404
  end
end

get '/eventos' do
  eventos = []
  calendarios = nil
  nombre = params['calendario']
  begin
    if !nombre.nil?
      calendarios = [repositorio_calendarios.obtener_calendario(nombre)]
    else
      calendarios = repositorio_calendarios.calendarios.values
    end
    calendarios.each do |calendario|
      calendario.eventos.values.each do |evento|
        eventos << evento
      end
    end
    salida = []
    eventos.each {|evento| salida << evento.to_h}
    JSON.pretty_generate(salida)
  rescue ExcepcionCalendarioInexistente
    status 400
  end
end

get '/eventos/:id' do
  begin
    id_evento = params[:id]
    repositorio_evento = nil
    repositorio_calendarios.calendarios.values.each do |calendario|
      repositorio_evento = calendario if calendario.eventos.key?(id_evento)
      repositorio_evento && break
    end
    raise ExcepcionEventoInexistente unless repositorio_evento
    evento = repositorio_evento.obtener_evento(id_evento)
    JSON.pretty_generate(evento.to_h)
  rescue ExcepcionEventoInexistente
    status 404
  end
end