require_relative '../model/frecuencia'

# Tipo de frecuencia semanal
class FrecuenciaSemanal < Frecuencia
  def initialize
    @frecuencia = 7
  end

  def to_s
    'Frecuencia Semanal'
  end
end