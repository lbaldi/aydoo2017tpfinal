require_relative '../model/evento'

# Representa un evento. Limitado por un inicio y un fin
# el cual se repite con una determinada frecuencia.
class EventoRecurrente < Evento
  attr_accessor :frecuencia
  attr_accessor :fin_recurrencia

  def initialize(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    super(id, nombre, inicio, fin)
    validar_intervalo_recurrencia(inicio, fin_recurrencia)
    @frecuencia = frecuencia
    @fin_recurrencia = fin_recurrencia
  end

  def inicio=(value)
    validar_intervalo_recurrencia(value, @fin_recurrencia)
    super(value)
  end

  def fin_recurrencia=(value)
    validar_intervalo_recurrencia(@inicio, value)
    @fin_recurrencia = value
  end

  def obtener_intervalo
    super
    # @TODO
    # Aca se debe devolver el listado de intervalos
    # que componen al evento recurrente hasta llegar
    # a su fecha fin siguiendo la frecuencia
    # Aca hay que usar el polimorfismo de la frecuencia
    # @frecuencia.obtener_frecuencia ..
  end

  private

  def validar_intervalo_recurrencia(inicio, fin_recurrencia)
    raise ExcepcionIntervaloErroneo if fin_recurrencia < inicio
  end
end