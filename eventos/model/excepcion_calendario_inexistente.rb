# Error para cuando una accion solicita un calendario inexistente
class ExcepcionCalendarioInexistente < StandardError
  def initialize(msg = 'Calendario Inexistente')
    super
  end
end