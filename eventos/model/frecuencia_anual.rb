require_relative '../model/frecuencia'

# Tipo de frecuencia anual
class FrecuenciaAnual < Frecuencia
  def initialize
    @frecuencia = 365
  end
end