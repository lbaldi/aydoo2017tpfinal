require 'rspec'
require_relative '../model/calendario'

describe 'Calendario' do
  it 'Crear un calendario a partir de un nombre' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    Calendario.new(datos_calendario)
  end

  it 'El calendario deberia guardar el nombre con el cual se crea' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    calendario = Calendario.new(datos_calendario)
    expect(calendario.nombre).to eq datos_calendario[:nombre]
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

  it 'Error al editar nombre de un calendario creado' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    calendario = Calendario.new(datos_calendario)
    expect { calendario.nombre = 'Nuevo Nombre' }.to raise_error
  end
end