require 'json'
require 'sinatra'
require_relative 'model/repositorio_calendarios'
require_relative 'model/calendario'
require_relative 'model/evento'

repositorio_calendarios = RepositorioCalendarios.new

post '/calendarios' do
  begin
    request.body.rewind
    body = JSON.parse request.body.read
    nombre_calendario = body['nombre']
    calendario = Calendario.new(nombre_calendario)
    repositorio_calendarios.almacenar_calendario(calendario)
  rescue  ExcepcionUnicidadCalendario,
          ExcepcionNombreCalendario
    status 400
  end
end

delete '/calendarios/:nombre' do
  begin
    nombre_calendario = params[:nombre]
    repositorio_calendarios.eliminar_calendario(nombre_calendario)
  rescue ExcepcionCalendarioInexistente
    status 400
  end
end

get '/calendarios' do
  puts repositorio_calendarios.calendarios
end

get '/calendarios/:nombre' do
  begin
    nombre_calendario = params[:nombre]
    calendario = repositorio_calendarios.obtener_calendario(nombre_calendario)
    puts calendario
  rescue ExcepcionCalendarioInexistente
    status 400
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
    evento = Evento.new(id_evento, nombre_evento, inicio_evento, fin_evento)
    calendario.almacenar_evento(evento)
  rescue  ExcepcionCalendarioInexistente,
          ExcepcionIntervaloErroneo,
          ExcepcionIntervaloMaximo,
          ExcepcionUnicidadEvento
    status 400
  end
end

put '/eventos' do
  begin
    request.body.rewind
    body = JSON.parse request.body.read
    nombre_calendario = body['calendario']
    id_evento = body['id']
    calendario = repositorio_calendarios.obtener_calendario(nombre_calendario)
    evento_original = calendario.obtener_evento(id_evento)
    nombre_original = evento_original.nombre
    inicio_original = evento_original.inicio
    fin_original = evento_original.fin
    nombre_evento = body.key?('nombre') ? body['nombre'] : nombre_original
    inicio_evento = body.key?('inicio') ? DateTime.parse(body['inicio']) : inicio_original
    fin_evento = body.key?('fin') ? DateTime.parse(body['fin']) : fin_original
    evento_reemplazante = Evento.new(
      id_evento,
      nombre_evento,
      inicio_evento,
      fin_evento
    )
    calendario.eliminar_evento(evento_original.id)
    calendario.almacenar_evento(evento_reemplazante)
  rescue  ExcepcionCalendarioInexistente,
          ExcepcionEventoInexistente,
          ExcepcionIntervaloErroneo,
          ExcepcionIntervaloMaximo
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
  rescue
    status 400
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
    puts eventos
  rescue ExcepcionCalendarioInexistente
    status 400
  end
end

get '/eventos/:id' do
  id_evento = params[:id]
  repositorio_evento = nil
  repositorio_calendarios.calendarios.values.each do |calendario|
    repositorio_evento = calendario if calendario.eventos.key?(id_evento)
    repositorio_evento && break
  end
  raise ExcepcionEventoInexistente unless repositorio_evento
  evento = repositorio_evento.obtener_evento(id_evento)
  puts evento
end