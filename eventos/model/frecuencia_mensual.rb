require_relative '../model/frecuencia'

# Tipo de frecuencia mensual
class FrecuenciaMensual < Frecuencia
  def initialize
    dia = 24
    @frecuencia = 30 * dia
  end
end