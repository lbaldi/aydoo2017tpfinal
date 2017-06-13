require 'rspec'
require_relative '../model/evento'
require_relative '../model/validador_id_de_eventos'

describe 'Validador de ID de eventos global' do

  it 'Se arroja error por al querer crear un evento con un id existente' do
    repositorio_1 = RepositorioCalendarios.new
    calendario_1 = Calendario.new('Calendario1')
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento_1 = Evento.new(id, nombre, inicio, fin)

    calendario_1.almacenar_evento(evento_1)
    repositorio_1.almacenar_calendario(calendario_1)
    repositorio_1.actualizar

    expect do
      evento_2 = Evento.new(id, nombre, inicio, fin)
    end.to raise_error(ExcepcionUnicidadGlobalEvento)

    GestorArchivoCalendarios.eliminar_calendarios_en_disco
  end

  it 'Se arroja error por al querer crear un evento con un id existente con mas calendarios y eventos' do
    repositorio_1 = RepositorioCalendarios.new
    calendario_1 = Calendario.new('Calendario1')
    calendario_2 = Calendario.new('Calendario2')
    calendario_3 = Calendario.new('Calendario3')
    id_1 = 'id_1'
    id_2 = 'id_2'
    id_3 = 'id_3'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento_1 = Evento.new(id_1, nombre, inicio, fin)
    evento_2 = Evento.new(id_2, nombre, inicio, fin)
    evento_3 = Evento.new(id_3, nombre, inicio, fin)
    calendario_1.almacenar_evento(evento_1)
    calendario_2.almacenar_evento(evento_2)
    calendario_3.almacenar_evento(evento_3)
    repositorio_1.almacenar_calendario(calendario_1)
    repositorio_1.almacenar_calendario(calendario_2)
    repositorio_1.almacenar_calendario(calendario_3)
    repositorio_1.actualizar

    expect do
      evento_4 = Evento.new(id_2, nombre, inicio, fin)
    end.to raise_error(ExcepcionUnicidadGlobalEvento)

    GestorArchivoCalendarios.eliminar_calendarios_en_disco
  end
end