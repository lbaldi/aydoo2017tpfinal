# Representa una recurrencia de un evento, con una frecuencia y un fin
class Recurrencia
  attr_accessor :frecuencia, :fin

  def initialize(frecuencia, fin)
    @frecuencia = frecuencia
    @fin = fin
  end
end