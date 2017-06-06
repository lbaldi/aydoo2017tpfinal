# Repositorio de eventos.
class Calendario
  attr_reader :nombre
  #Repositorio de eventos para el calendario
  attr_accessor :eventos
  # @TODO agregar funciones para su uso

  def initialize(params)
    validar_parametros(params)
    @nombre = params[:nombre]
    @eventos = Array.new
  end

  def validar_parametros(params)
    raise TypeError unless params.is_a? Hash
    raise TypeError unless params[:nombre].is_a? String
  end

  def insertar_evento(params)
  	raise TypeError unless params.is_a? Evento
  	@eventos << params
  end

end