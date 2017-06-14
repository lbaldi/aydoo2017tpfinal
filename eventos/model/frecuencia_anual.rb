require_relative '../model/frecuencia'

# Tipo de frecuencia anual
class FrecuenciaAnual < Frecuencia
  def initialize
    @frecuencia = 365
  end

  def to_s
    'Frecuencia Anual'
  end
end