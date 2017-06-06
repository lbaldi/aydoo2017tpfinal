require 'rspec'
require_relative '../model/evento'

describe 'Evento' do
  it 'Crear un evento a partir de un id, nombre, inicio y fin' do
    Evento.new(
      'id_1',
      'Evento_1',
      DateTime.now,
      DateTime.now
    )
  end

  it 'Error al crear un evento sin id' do
    expect do
      Evento.new(
        nil,
        'Evento_1',
        DateTime.now,
        DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de id' do
    expect do
      Evento.new(
          1,
          'Evento_1',
          DateTime.now,
          DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin nombre' do
    expect do
      Evento.new(
        'id_1',
        nil,
        DateTime.now,
        DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de nombre' do
    expect do
      Evento.new(
          'id_1',
          1,
          DateTime.now,
          DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin inicio' do
    expect do
      Evento.new(
        'id_1',
        'Evento_1',
        nil,
        DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de inicio' do
    expect do
      Evento.new(
          'id_1',
          'Evento_1',
          DateTime.now.to_s,
          DateTime.now
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento sin fin' do
    expect do
      Evento.new(
        'id_1',
        'Evento_1',
        DateTime.now,
        nil
      )
    end.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de fin' do
    expect do
      Evento.new(
          'id_1',
          'Evento_1',
          DateTime.now,
          DateTime.now.to_s,
      )
    end.to raise_error(TypeError)
  end
end