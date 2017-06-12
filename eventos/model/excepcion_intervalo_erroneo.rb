# Error para cuando el intervalo entre fecha / hora inicio
# y fecha / hora fin es erroneo. Se toma como erroneo si
# fecha / hora fin es menor a la fecha / hora inicio.
class ExcepcionIntervaloErroneo < StandardError
  def initialize(msg = 'Fecha / hora fin no puede ser menor a la de inicio')
    super
  end
end