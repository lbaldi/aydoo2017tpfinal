require_relative '../model/frecuencia'

# Tipo de frecuencia semanal
class FrecuenciaSemanal < Frecuencia
  def initialize
    dia = 24
    @frecuencia = 7 * dia
  end
end