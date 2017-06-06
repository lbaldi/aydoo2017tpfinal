require 'rspec'
require_relative '../model/calendario'
require_relative '../model/evento'

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

  it 'Se agrega un evento al calendario' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: nil
    }
    evento_calendario = Evento.new(datos_evento)
    calendario = Calendario.new(datos_calendario)
    calendario.insertar_evento(evento_calendario)
  end

  it 'El calendario debería almacenar el evento guardado' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: nil
    }
    evento_calendario = Evento.new(datos_evento)
    calendario = Calendario.new(datos_calendario)
    calendario.insertar_evento(evento_calendario)

    expect(calendario.eventos[0]).to eq evento_calendario
  end

  it 'Error al querer insertar un evento que no es del tipo Evento' do
    datos_calendario = {
      nombre: 'Calendario 1'
    }
    calendario = Calendario.new(datos_calendario)
    expect { calendario.insertar_evento(3)}.to raise_error(TypeError)
  end

end