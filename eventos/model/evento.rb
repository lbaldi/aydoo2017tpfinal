# Representa un evento. Limitado por
# un inicio y un fin, puede que el mismo
# posea o no una recurrencia.
class Evento
  def initialize(id, nombre, inicio, fin, recurrencia = nil)
    raise TypeError unless id.is_a? String
    raise TypeError unless nombre.is_a? String
    raise TypeError unless inicio.is_a? DateTime
    raise TypeError unless fin.is_a? DateTime
    @id = id
    @nombre = nombre
    @inicio = inicio
    @fin = fin
    @recurrencia = recurrencia
  end
end