# Error para cuando una accion solicita un evento inexistente
class ExcepcionEventoInexistente < StandardError
  def initialize(msg = 'Evento Inexistente')
    super
  end
end