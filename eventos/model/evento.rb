require_relative '../model/regla_intervalo_evento'
require_relative '../model/excepcion_intervalo_erroneo'

# Representa un evento. Limitado por un inicio y un fin
class Evento
  attr_reader :id
  attr_accessor :nombre, :inicio, :fin

  def initialize(id, nombre, inicio, fin)
    validar_lapso(inicio, fin)
    @id = id
    @nombre = nombre
    @inicio = inicio
    @fin = fin
  end

  def inicio=(value)
    validar_lapso(value, @fin)
    @inicio = value
  end

  def fin=(value)
    validar_lapso(@inicio, value)
    @fin = value
  end

  private

  def validar_lapso(inicio, fin)
    raise ExcepcionIntervaloErroneo if fin < inicio
    intervalo_en_horas = convertir_a_horas(fin - inicio)
    puts inicio, fin
    ReglaIntervaloEvento.validar_horas(intervalo_en_horas)
  end

  def convertir_a_horas(intervalo)
    conversor_a_horas = (1 / 24.0)
    intervalo / conversor_a_horas
  end
end