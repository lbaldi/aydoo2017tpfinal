# Error para violacion de unicidad global de eventos segun id
class ExcepcionUnicidadGlobalEvento < StandardError
  def initialize(msg = 'Ya existe un evento con ese id.')
    super
  end
end
