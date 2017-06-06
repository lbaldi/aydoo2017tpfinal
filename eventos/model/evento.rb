# Representa un evento. Limitado por
# un inicio y un fin, puede que el mismo
# posea o no una recurrencia.
class Evento
  def initialize(id, nombre, inicio, fin, recurrencia=nil)
    @id = id
    @nombre = nombre
    @inicio = inicio
    @fin = fin
    @recurrencia = recurrencia
  end
end