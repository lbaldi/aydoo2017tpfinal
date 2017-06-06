require 'rspec'
require_relative '../model/calendario'

describe 'Calendario' do
  it 'Crear un calendario a partir de un nombre' do
    Calendario.new(nombre: 'Calendario 1')
  end

  it 'Error al crear un calendario sin parametros' do
    expect { Calendario.new(nil) }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario con un formato invalido de parametros' do
    expect { Calendario.new("Calendario 1") }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario sin nombre' do
    expect { Calendario.new(otro_parametro: 'Calendario 1') }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario con un formato con un formato invalido de nombre' do
    expect { Calendario.new(nombre: 1) }.to raise_error(TypeError)
  end
end