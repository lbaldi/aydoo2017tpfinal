require 'rspec'
require_relative '../model/calendario'

describe 'Calendario' do
  it 'Se deberia crear a partir de un nombre' do
    nombre_calendario = 'Calendario 1'
    Calendario.new(nombre_calendario)
  end

  it 'Deberia guardar el nombre con el cual se crea' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect(calendario.nombre).to eq nombre_calendario
  end

  it 'Error al crear un calendario sin nombre' do
    expect do
      Calendario.new('')
    end.to raise_error(ExcepcionNombreCalendario)
  end

  it 'Error al editar nombre' do
    nombre_calendario = 'Nombre Calendario'
    nuevo_nombre_calendario = 'Nuevo Nombre'
    calendario = Calendario.new(nombre_calendario)
    expect { calendario.nombre = nuevo_nombre_calendario }.to raise_error
  end

  it 'Debe poder almacenar un evento' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
  end

  it 'Debe poder almacenar varios eventos' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    otro_evento = double('Evento 2')
    allow(otro_evento).to receive(:id).and_return('id_2')
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    calendario.almacenar_evento(otro_evento)
  end

  it 'Error al crear un evento con mismo id que uno existente' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    otro_evento = double('Evento 2')
    allow(otro_evento).to receive(:id).and_return('id_1')
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    expect do
      calendario.almacenar_evento(otro_evento)
    end.to raise_error(ExcepcionUnicidadEvento)
  end

  it 'Deberia poder obtener un evento existente' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    expect(calendario.obtener_evento(evento.id)).to eq evento
  end

  it 'Error al obtener un evento inexistente' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect do
      calendario.obtener_evento('inexistente')
    end.to raise_error(ExcepcionEventoInexistente)
  end

  it 'Deberia poder eliminar un evento existente' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    calendario.eliminar_evento(evento.id)
  end

  it 'Error al eliminar un evento inexistente' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect do
      calendario.eliminar_evento('inexistente')
    end.to raise_error(ExcepcionEventoInexistente)
  end
end