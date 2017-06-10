require 'json'
require_relative 'calendario'
require_relative '../model/excepcion_unicidad_calendario'

# Repositorio de calendarios
class RepositorioCalendarios
  attr_accessor :calendarios

  def initialize
    @calendarios = {}
  end

  def almacenar_calendario(calendario)
    identificacion = estandarizar_identificacion(calendario.nombre)
    comprobar_unicidad_calendario(identificacion)
    @calendarios[identificacion] = calendario
  end

  def obtener_calendario(identificacion)
    identificacion = estandarizar_identificacion(identificacion)
    @calendarios[identificacion]
  end

  def eliminar_calendario(identificacion)
    identificacion = estandarizar_identificacion(identificacion)
    @calendarios.delete(identificacion)
  end

  private

  def comprobar_unicidad_calendario(identificacion)
    raise ExcepcionUnicidadCalendario if @calendarios.key?(identificacion)
  end

  def estandarizar_identificacion(identificacion)
    identificacion.downcase
  end
end