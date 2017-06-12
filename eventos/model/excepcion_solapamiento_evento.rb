# Error para cuando se solapan los intervalos
# de tiempo entre eventos de un calendario
class ExcepcionSolapamientoEvento < StandardError
  def initialize(msg = 'No se pueden solapar eventos en un mismo calendario.')
    super
  end
end