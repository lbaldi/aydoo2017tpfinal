require 'rspec'

require_relative '../model/gestor_archivo_calendarios'
require_relative '../model/calendario'

describe 'Gestor de archivo de calendarios' do

  it 'El metodo guardar calendarios debe crear un archivo con el nombre "calendarios"' do
    objeto_a_almacenar = {}
    GestorArchivoCalendarios.guardar_calendarios_en_disco(objeto_a_almacenar)
    expect(File.exist?('calendarios')).to be true
  end

  it 'Debe poder almacenar calendarios en un archivo' do
    calendarios_a_almacenar = {}
    calendario1 = Calendario.new('Calendario1')
    calendarios_a_almacenar[calendario1.nombre] = calendario1
    GestorArchivoCalendarios.guardar_calendarios_en_disco(calendarios_a_almacenar)
  end

  it 'Debe poder leer correctamente un calendario almacenado en un archivo' do
    calendarios_a_almacenar = {}
    calendario1 = Calendario.new('Calendario1')
    calendarios_a_almacenar[calendario1.nombre] = calendario1
    GestorArchivoCalendarios.guardar_calendarios_en_disco(calendarios_a_almacenar)
    calendarios_leidos = GestorArchivoCalendarios.leer_calendarios_en_disco
    expect(calendarios_leidos[calendario1.nombre].nombre).to eq calendarios_a_almacenar[calendario1.nombre].nombre
  end

  it 'Debe poder borrar un archivo de calendarios creado' do
    calendarios_a_almacenar = {}
    GestorArchivoCalendarios.guardar_calendarios_en_disco(calendarios_a_almacenar)
    GestorArchivoCalendarios.eliminar_calendarios_en_disco
    expect(File.exist?('calendarios')).to be false
  end
end