require_relative '../model/excepcion_nombre_calendario'
require_relative '../model/excepcion_unicidad_evento'
require_relative '../model/excepcion_evento_inexistente'

NOMBRE_VACIO = ''.freeze

# Repositorio de eventos.
class Calendario
  attr_reader :nombre
  attr_reader :eventos

  def initialize(nombre)
    validar_nombre(nombre)
    @nombre = nombre
    @eventos = {}
  end

  def almacenar_evento(evento)
    # @TODO
    # - Pensar como hacemos la validacion de id global
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

  def comprobar_solapamiento_evento(evento)
    # @TODO
    # - Obtener lapsos cubiertos por la lista de eventos
    #   y comparar a los que ocuparia este evento
    #   al evento siempre solicitar los lapsos ya sea
    #   recurrente o no.
    #   Para esto va a falta crear la clase de evento
    #   recursivo, excepcion de solapamiento.
  end
end