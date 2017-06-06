require 'rspec'
require_relative '../model/calendario'

describe 'Calendario' do
  it 'Crear un calendario a partir de un nombre' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    Calendario.new(datos_calendario)
  end

  it 'Error al crear un calendario sin parametros' do
    datos_calendario = nil
    expect { Calendario.new(datos_calendario) }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario con un formato invalido de parametros' do
    datos_calendario = 'Calendario 1'
    expect { Calendario.new(datos_calendario) }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario sin nombre' do
    datos_calendario = {
      otro_parametro: 'Calendario 1'
    }
    expect { Calendario.new(datos_calendario) }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario con un formato invalido de nombre' do
    datos_calendario = {
      nombre: 1
    }
    expect { Calendario.new(datos_calendario) }.to raise_error(TypeError)
  end
end