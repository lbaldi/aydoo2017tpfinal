# Repositorio de eventos.
class Calendario
  attr_reader :nombre

  def initialize(params)
    validar_parametros(params)
    @nombre = params[:nombre]
  end

  def validar_parametros(params)
    raise TypeError unless params.is_a? Hash
    raise TypeError unless params[:nombre].is_a? String
  end
end