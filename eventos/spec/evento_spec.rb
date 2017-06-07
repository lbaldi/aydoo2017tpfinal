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

  it 'Crear un evento a partir de un id, nombre, inicio, fin y recurrencia nulo' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: nil
    }
    Evento.new(datos_evento)
  end

  it 'Error al crear un evento sin parametros' do
    datos_evento = nil
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con formato invalido de parametros' do
    datos_evento = 'Evento 1'
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
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

  it 'Error al crear un evento con formato invalido de recurrencia' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: 'recurrencia'
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con recurrencia sin frecuencia ni fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {}
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con recurrencia sin fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria'
      }
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con recurrencia con formato invalido de fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now.to_s
      }
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con recurrencia sin frecuencia' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        fin: DateTime.now
      }
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Error al crear un evento con recurrencia con formato invalido de fin' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: nil,
        fin: DateTime.now
      }
    }
    expect { Evento.new(datos_evento) }.to raise_error(TypeError)
  end

  it 'Crear un evento con recurrencia' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    Evento.new(datos_evento)
  end

  it 'El evento debe guardar el id con el cual se crea' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    evento = Evento.new(datos_evento)
    expect(evento.id).to eq datos_evento[:id]
  end

  it 'El evento debe guardar el nombre con el cual se crea' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    evento = Evento.new(datos_evento)
    expect(evento.nombre).to eq datos_evento[:nombre]
  end

  it 'El evento debe guardar el inicio con el cual se crea' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    evento = Evento.new(datos_evento)
    expect(evento.inicio).to eq datos_evento[:inicio]
  end

  it 'El evento debe guardar el fin con el cual se crea' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    evento = Evento.new(datos_evento)
    expect(evento.fin).to eq datos_evento[:fin]
  end

  it 'El evento debe guardar la recurrencia con el cual se crea' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    evento = Evento.new(datos_evento)
    expect(evento.recurrencia).to eq datos_evento[:recurrencia]
  end

  it 'Error al editar id de un evento creado' do
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now,
      recurrencia: {
        frecuencia: 'diaria',
        fin: DateTime.now
      }
    }
    evento = Evento.new(datos_evento)
    expect { evento.id = 'nuevo id' }.to raise_error
  end

end