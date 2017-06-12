require_relative '../model/evento'
class EventoRecurrente < Evento
  attr_accessor :recurrencia

  def initialize(id, nombre, inicio, fin, recurrencia)
    super(id, nombre, inicio, fin)
    @recurrencia = recurrencia
  end

end