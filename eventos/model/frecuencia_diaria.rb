require_relative '../model/frecuencia'

# Tipo de frecuencia diaria
class FrecuenciaDiaria < Frecuencia
  def initialize
    dia = 24
    @frecuencia = 1 * dia
  end
end