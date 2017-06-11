# Error para violacion de unicidad de eventos segun id
class ExcepcionUnicidadEvento < StandardError
  def initialize(msg = 'Ya existe un evento con ese id.')
    super
  end
end
