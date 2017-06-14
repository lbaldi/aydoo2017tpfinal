require_relative '../model/excepcion_nombre_calendario'
require_relative '../model/excepcion_unicidad_evento'
require_relative '../model/excepcion_evento_inexistente'
require_relative '../model/excepcion_solapamiento_evento'

NOMBRE_VACIO = ''.freeze

# Repositorio de eventos.
class Calendario
  attr_reader :nombre
  attr_reader :eventos

  def to_h
    {
      "nombre" => @nombre
    }
  end

  def initialize(nombre)
    validar_nombre(nombre)
    @nombre = nombre
    @eventos = {}
  end

  def almacenar_evento(evento)
    identificacion = evento.id
    comprobar_unicidad_evento(identificacion)
    comprobar_solapamiento_evento(evento)
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
    raise ExcepcionNombreCalendario if nombre == NOMBRE_VACIO
  end

  def comprobar_unicidad_evento(identificacion)
    raise ExcepcionUnicidadEvento if @eventos.key?(identificacion)
  end

  def comprobar_solapamiento_evento(nuevo_evento)
    intervalos = []
    @eventos.values.each do |evento|
      intervalos.push(evento.obtener_intervalo)
    end
    intervalos.push(nuevo_evento.obtener_intervalo)
    intervalos && intervalos.flatten!
    intervalos = intervalos.sort_by {|intervalo| intervalo.min}
    while intervalos.each_cons(2).any? {|a, b|
      min_interseccion = [a.min, b.min].max
      max_interseccion = [a.max, b.max].min
      interseccion = min_interseccion <= max_interseccion
      interseccion && raise(ExcepcionSolapamientoEvento)
    }
    end
  end
end