require 'rspec'
require_relative '../model/calendario'
require_relative '../model/evento'

describe 'Calendario' do
  it 'Se deberia crear a partir de un nombre' do
    nombre_calendario = 'Calendario 1'
    Calendario.new(nombre_calendario)
  end

  it 'Deberia guardar el nombre con el cual se crea en minuscula' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect(calendario.nombre).to eq nombre_calendario.downcase
  end

  it 'Error al crear un calendario sin nombre' do
    expect { Calendario.new(nil) }.to raise_error
  end

  it 'Error al crear un calendario con nombre vacio' do
    expect { Calendario.new('') }.to raise_error
  end

  it 'Error al editar nombre' do
    nombre_calendario = 'Nombre Calendario'
    nuevo_nombre_calendario = 'Nuevo Nombre'
    calendario = Calendario.new(nombre_calendario)
    expect { calendario.nombre = nuevo_nombre_calendario }.to raise_error
  end

  it 'Debe crear un evento a partir de un conjunto de datos correctos' do
    nombre_calendario = 'Calendario 1'
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    Calendario.new(nombre_calendario).crear_evento(datos_evento)
  end

  it 'Error al crear un evento con el mismo id que uno existente' do
    nombre_calendario = 'Calendario 1'
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
    calendario = Calendario.new(nombre_calendario)
    calendario.crear_evento(datos_un_evento)
    expect { calendario.crear_evento(datos_otro_evento) }.to raise_error
  end

  it 'Contener un evento que fue creado' do
    nombre_calendario = 'Calendario 1'
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    calendario = Calendario.new(nombre_calendario)
    evento = calendario.crear_evento(datos_evento)
    expect(calendario.obtener_evento(evento.id)).to eq evento
  end

  it 'Eliminar un evento inexistente en el calendario' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect(calendario.eliminar_evento('otro_id')).to eq nil
  end

  it 'Deberia obtener nil al obtener un evento que no contiene' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect(calendario.obtener_evento('otro_id')).to eq nil
  end

  it 'Obtener el evento que solicito eliminar' do
    nombre_calendario = 'Calendario 1'
    datos_evento = {
      id: 'id_1',
      nombre: 'Evento_1',
      inicio: DateTime.now,
      fin: DateTime.now
    }
    calendario = Calendario.new(nombre_calendario)
    evento = calendario.crear_evento(datos_evento)
    expect(calendario.eliminar_evento(evento.id)).to eq evento
  end

  it 'No deberia obtener un evento inexistente' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect(calendario.obtener_evento('un evento')).to eq nil
  end
end