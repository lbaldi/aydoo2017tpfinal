require_relative '../model/frecuencia'

# Tipo de frecuencia diaria
class FrecuenciaDiaria < Frecuencia
  def initialize
    @frecuencia = 1
  end

  def to_s
    'Frecuencia Diaria'
  end
end