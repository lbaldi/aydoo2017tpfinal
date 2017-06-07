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

  it 'Debe crear un evento a partir de un conjunto de datos correctos' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    datos_evento = {
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
    }
    Calendario.new(datos_calendario).crear_evento(datos_evento)
  end

  it 'Error al crear un evento cuando ya existia en el calendario uno con el mismo id' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    datos_un_evento = {
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
    }
    datos_otro_evento = {
        id: 'id_1',
        nombre: 'Evento_2',
        inicio: DateTime.now,
        fin: DateTime.now
    }
    calendario = Calendario.new(datos_calendario)
    calendario.crear_evento(datos_un_evento)
    expect { calendario.crear_evento(datos_otro_evento) }.to raise_error
  end

  it 'Si creo un evento y solicito el diccionario de eventos deberia contenerlo' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    datos_evento = {
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
    }
    calendario = Calendario.new(datos_calendario)
    evento = calendario.crear_evento(datos_evento)
    expect(calendario.obtener_evento(evento.id)).to eq evento
  end

  it 'No deberia dar error al intentar eliminar un evento que no contiene' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    calendario = Calendario.new(datos_calendario)
    expect(calendario.eliminar_evento('otro_id')).to eq nil
  end

  it 'Deberia obtener nil al obtener un evento que no contiene' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    calendario = Calendario.new(datos_calendario)
    expect(calendario.obtener_evento('otro_id')).to eq nil
  end

  it 'Si pido eliminar un evento que contenia el calendario deberia obtener el evento eliminado' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    datos_evento = {
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
    }
    calendario = Calendario.new(datos_calendario)
    evento = calendario.crear_evento(datos_evento)
    expect(calendario.eliminar_evento(evento.id)).to eq evento
  end

  it 'No deberia poder obtener un evento que fue eliminado del calendario' do
    datos_calendario = {
        nombre: 'calendario 1'
    }
    datos_evento = {
        id: 'id_1',
        nombre: 'Evento_1',
        inicio: DateTime.now,
        fin: DateTime.now
    }
    calendario = Calendario.new(datos_calendario)
    evento = calendario.crear_evento(datos_evento)
    calendario.eliminar_evento(evento.id)
    expect(calendario.obtener_evento(evento.id)).to eq nil
  end

end