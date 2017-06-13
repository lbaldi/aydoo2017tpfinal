require_relative '../model/frecuencia'

# Tipo de frecuencia anual
class FrecuenciaAnual < Frecuencia
  def initialize
    dia = 24
    @frecuencia = 365 * dia
  end
end