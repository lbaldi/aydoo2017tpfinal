require_relative '../model/regla_intervalo_evento'
require_relative '../model/validador_id_de_eventos'
require_relative '../model/excepcion_intervalo_erroneo'

CONVERSOR_HORAS = (1 / 24.0)

# Representa un evento. Limitado por un inicio y un fin
class Evento
  attr_reader :id
  attr_accessor :nombre, :inicio, :fin

  def initialize(id, nombre, inicio, fin)
    validar_evento(id, inicio, fin)
    @id = id
    @nombre = nombre
    @inicio = inicio
    @fin = fin
  end

  def inicio=(value)
    validar_intervalo(value, @fin)
    @inicio = value
  end

  def fin=(value)
    validar_intervalo(@inicio, value)
    @fin = value
  end

  def obtener_intervalo
    @inicio..@fin
  end

  private

  def validar_evento (id, inicio, fin)
    validar_id_evento(id)
    validar_intervalo(inicio, fin)
  end

  def validar_intervalo(inicio, fin)
    raise ExcepcionIntervaloErroneo if fin < inicio
    intervalo_en_horas = convertir_a_horas(fin - inicio)
    ReglaIntervaloEvento.validar_horas(intervalo_en_horas)
  end

  def convertir_a_horas(intervalo)
    intervalo / CONVERSOR_HORAS
  end

  def validar_id_evento(id)
    ValidadorIdDeEventos.comprobar_unicidad_global_de_evento_por_id(id)
  end
end