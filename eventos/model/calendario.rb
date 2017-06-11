require_relative '../model/excepcion_nombre_calendario'
require_relative '../model/excepcion_unicidad_evento'
require_relative '../model/excepcion_evento_inexistente'

# Repositorio de eventos.
class Calendario
  attr_reader :nombre
  attr_accessor :eventos

  def initialize(nombre)
    validar_nombre(nombre)
    @nombre = nombre
    @eventos = {}
  end

  def almacenar_evento(evento)
    identificacion = evento.id
    comprobar_unicidad_evento(identificacion)
    @eventos[identificacion] = evento
  end

  def obtener_evento(identificacion)
    @eventos[identificacion] || raise(ExcepcionEventoInexistente)
  end

  def eliminar_evento(identificacion)
    raise ExcepcionEventoInexistente unless @eventos.delete(identificacion)
  end

  private

  def validar_nombre(nombre)
    nombre_vacio = ''
    raise ExcepcionNombreCalendario if nombre == nombre_vacio
  end

  def comprobar_unicidad_evento(identificacion)
    raise ExcepcionUnicidadEvento if @eventos.key?(identificacion)
  end
end