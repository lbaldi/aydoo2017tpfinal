# Repositorio de eventos.
class Calendario
  def initialize(params)
    raise TypeError unless params.is_a? Hash
    raise TypeError unless params[:nombre].is_a? String
    @nombre = params[:nombre]
  end
end