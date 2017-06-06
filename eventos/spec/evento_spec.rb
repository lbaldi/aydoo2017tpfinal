require 'rspec'
require_relative '../model/evento'

describe 'Evento' do
  it 'Crear un evento a partir de un id, nombre, inicio y fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    Evento.new(datos_evento)
  end

  it 'Error al crear un evento sin id' do
    datos_evento = {
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de id' do
    datos_evento = {
      id: 1,
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin nombre' do
    datos_evento = {
      id: 'id_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de nombre' do
    datos_evento = {
      id: 'id_1',
      nombre: 1,
      inicio: DateTime.now,
      fin: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin inicio' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      fin: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de inicio' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now.to_s,
      fin: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now.to_s
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end
end