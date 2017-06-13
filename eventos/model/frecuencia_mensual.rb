require_relative '../model/frecuencia'

# Tipo de frecuencia mensual
class FrecuenciaMensual < Frecuencia
  def initialize
    @frecuencia = 30
  end
end