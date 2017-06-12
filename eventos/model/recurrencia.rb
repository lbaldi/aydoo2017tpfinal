require_relative '../model/excepcion_frecuencia_no_definida'

FRECUENCIA_VACIA = ''.freeze

# Representa una recurrencia de un evento, con una frecuencia y un fin
class Recurrencia
  attr_accessor :frecuencia, :fin

  def initialize(frecuencia, fin)
    validar_frecuencia(frecuencia)
    @frecuencia = frecuencia
    @fin = fin
  end

  def validar_frecuencia(frecuencia)
    raise ExcepcionFrecuenciaNoDefinida if frecuencia == FRECUENCIA_VACIA
  end
end