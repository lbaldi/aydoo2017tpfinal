class EventoRecurrente < Evento
  attr_accessor :recurrencia

  def initialize(id, nombre, inicio, fin, recurrencia)
    super
    @recurrencia = recurrencia
  end

end