require 'rspec'
require_relative '../model/repositorio_calendarios'
require_relative '../model/calendario'
require_relative '../model/../model/gestor_archivo_calendarios'

describe 'Repositorio Calendarios' do
  it 'Debe poder almacenar un calendario' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    repositorio.almacenar_calendario(calendario)
  end

  it 'Debe poder almacenar varios calendarios' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    otro_calendario = double('Calendario 2')
    allow(otro_calendario).to receive(:nombre).and_return('Calendario 2')
    repositorio = RepositorioCalendarios.new
    repositorio.almacenar_calendario(calendario)
    repositorio.almacenar_calendario(otro_calendario)
  end

  # En este caso la identificacion es la misma
  # y los nombres de calendario son iguales
  it 'Error al almacenar un calendario con una identificacion ya almacenada' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    otro_calendario = double('Calendario 1')
    allow(otro_calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    repositorio.almacenar_calendario(calendario)
    expect do
      repositorio.almacenar_calendario(otro_calendario)
    end.to raise_error(ExcepcionUnicidadCalendario)
  end

  # En este caso la identificacion es la misma
  # pero los nombres de los calendarios son diferentes
  it 'Error al almacenar un calendario con una identificacion ya almacenada' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    otro_calendario = double('cAlEndArio 1')
    allow(otro_calendario).to receive(:nombre).and_return('cAlEndArio 1')
    repositorio = RepositorioCalendarios.new
    repositorio.almacenar_calendario(calendario)
    expect do
      repositorio.almacenar_calendario(otro_calendario)
    end.to raise_error(ExcepcionUnicidadCalendario)
  end

  it 'Deberia poder obtener un calendario existente' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    calendario = repositorio.almacenar_calendario(calendario)
    expect(repositorio.obtener_calendario(calendario.nombre)).to eq calendario
  end

  it 'Error al obtener un calendario inexistente' do
    repositorio = RepositorioCalendarios.new
    expect do
      repositorio.obtener_calendario('inexistente')
    end.to raise_error(ExcepcionCalendarioInexistente)
  end

  it 'Deberia poder eliminar un calendario existente' do
    calendario = double('Calendario 1')
    allow(calendario).to receive(:nombre).and_return('Calendario 1')
    repositorio = RepositorioCalendarios.new
    calendario = repositorio.almacenar_calendario(calendario)
    repositorio.eliminar_calendario(calendario.nombre)
  end

  it 'Error al eliminar un calendario inexistente' do
    repositorio = RepositorioCalendarios.new
    expect do
      repositorio.eliminar_calendario('inexistente')
    end.to raise_error(ExcepcionCalendarioInexistente)
  end

  # Luego de cada caso de prueba, se elimina la lista de calendarios para evitar hacerlo manualmente
  it 'Deberia poder actualizar la lista de calendarios del gestor' do
    repositorio = RepositorioCalendarios.new
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    repositorio.almacenar_calendario(calendario)
    repositorio.actualizar
    GestorArchivoCalendarios.eliminar_calendarios_en_disco
  end

  it 'Deberia poder obtener la lista de calendarios del gestor de archivo de calendarios' do
    repositorio = RepositorioCalendarios.new
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    repositorio.almacenar_calendario(calendario)
    repositorio.actualizar
    repositorio.obtener_lista_calendarios
    GestorArchivoCalendarios.eliminar_calendarios_en_disco
  end

  it 'El calendario actualizado en disco invocando al gestor debe coincidir con el que se requirio actualizar' do
    repositorio = RepositorioCalendarios.new
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    repositorio.almacenar_calendario(calendario)
    repositorio.actualizar
    expect(repositorio.calendarios[calendario.nombre]).to eq repositorio.obtener_lista_calendarios[calendario.nombre]
    GestorArchivoCalendarios.eliminar_calendarios_en_disco
  end
end