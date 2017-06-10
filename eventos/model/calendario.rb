require_relative '../model/excepcion_nombre_calendario'
require_relative '../model/excepcion_unicidad_evento'

# Repositorio de eventos.
class Calendario
  attr_reader :nombre
  attr_accessor :eventos

  def initialize(nombre)
    nombre = estandarizar_nombre(nombre)
    validar_nombre(nombre)
    @nombre = nombre
    @eventos = {}
  end

  def crear_evento(params)
    evento = Evento.new(params)
    comprobar_unicidad_evento(evento.id)
    @eventos[evento.id] = evento
  end

  def comprobar_unicidad_evento(id)
    raise ExcepcionUnicidadEvento if @eventos.key?(id)
  end

  def obtener_evento(id)
    @eventos[id]
  end

  def eliminar_evento(id)
    @eventos.delete(id)
  end

  private

  def validar_nombre(nombre)
    raise ExcepcionNombreCalendario if nombre == ''
  end

  def estandarizar_nombre(nombre)
    nombre.downcase
  end
end