# Error que se da cuando se quiere crear una recurrencia con una frecuencia sin definir
class ExcepcionFrecuenciaNoDefinida < StandardError
  def initialize(msg = 'No se puede crear una recurrencia con una frecuencia sin definir')
    super
  end
end