# Error para nombres invalidos en calendario
class ExcepcionNombreCalendario < StandardError
  def initialize(msg = 'No se puede crear un calendario sin nombre')
    super
  end
end