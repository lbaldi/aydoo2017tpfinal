# Repositorio de eventos.
class Calendario
  attr_reader :nombre
  attr_accessor :eventos

  def initialize(params)
    validar_parametros(params)
    @nombre = params[:nombre]
    @eventos = {}
  end

  def validar_parametros(params)
    raise TypeError unless params.is_a? Hash
    raise TypeError unless params[:nombre].is_a? String
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
end