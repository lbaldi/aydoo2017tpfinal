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
    # @TODO
    # - Cubrir caso horario < 72 hs
    #   Va a faltar crear la excepcion de lapso
  end
end