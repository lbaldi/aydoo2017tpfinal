require 'json'
require_relative 'calendario'
require_relative '../model/excepcion_unicidad_calendario'

# Repositorio de calendarios
class GestorDeCalendario
  attr_accessor :calendarios

  def initialize
    @calendarios = {}
  end

  def crear_calendario(params)
    calendario = Calendario.new(params)
    comprobar_unicidad_calendario(calendario.nombre)
    @calendarios[calendario.nombre] = calendario
  end

  def comprobar_unicidad_calendario(nombre)
    raise ExcepcionUnicidadCalendario if @calendarios.key?(nombre)
  end

  def obtener_calendario(nombre)
    @calendarios[nombre]
  end

  def eliminar_calendario(nombre)
    @calendarios.delete(nombre)
  end

  def write_file(path)
    tempHash = JSON.dump @calendarios
    File.open(path, "w") do |f|
      f.write(tempHash)
    end
  end

  def read_file(path)
    f = File.read(path)
    load = JSON.load f
    @calendarios = load if load else {}
  end
end