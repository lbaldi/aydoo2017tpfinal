require 'rspec'
require_relative '../model/calendario'

describe 'Calendario' do
  it 'Crear un calendario a partir de un nombre' do
    Calendario.new('Calendario 1')
  end

  it 'Error al crear un calendario sin nombre' do
    expect { Calendario.new(nil) }.to raise_error(TypeError)
  end

  it 'Error al crear un calendario a partir de algo que no sea string' do
    expect { Calendario.new(1) }.to raise_error(TypeError)
  end
end