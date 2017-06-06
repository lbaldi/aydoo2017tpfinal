require 'rspec'
require_relative '../model/evento'

describe 'Evento' do
  it 'Crear un evento a partir de un id, nombre, inicio y fin' do
    Evento.new(
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    )
  end

  it 'Error al crear un evento sin id' do
    expect do
      Evento.new(
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de id' do
    expect do
      Evento.new(
        id: 1,
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin nombre' do
    expect do
      Evento.new(
        id: 'id_1',
        inicio: DateTime.now,
        fin: DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de nombre' do
    expect do
      Evento.new(
        id: 'id_1',
        nombre: 1,
        inicio: DateTime.now,
        fin: DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin inicio' do
    expect do
      Evento.new(
        id: 'id_1',
        nombre: 'Evento_1',
        fin: DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de inicio' do
    expect do
      Evento.new(
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now.to_s,
        fin: DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin fin' do
    expect do
      Evento.new(
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de fin' do
    expect do
      Evento.new(
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now.to_s
      )
    end.to raise_error(TypeError)
  end
end