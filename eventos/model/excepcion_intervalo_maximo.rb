# Error para cuando la regla de intervalo de
# evento no se cumple
class ExcepcionIntervaloMaximo < StandardError
  def initialize(msg = 'El intervalo maximo para un evento en horas es de 72')
    super
  end
end