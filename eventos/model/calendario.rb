# Repositorio de eventos
class Calendario
  def initialize(nombre)
    raise TypeError unless nombre.is_a? String
    @nombre = nombre
  end
end