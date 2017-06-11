# Error para violacion de unicidad de calendarios segun nombre
class ExcepcionUnicidadCalendario < StandardError
  def initialize(msg = 'Ya existe un calendario con ese nombre.')
    super
  end
end
