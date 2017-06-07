# Repositorio de calendarios
class GestorDeCalendario
  attr_accessor :calendarios

  def initialize
    @calendarios = {}
  end

  def crear_calendario(params)
    calendario = Calendario.new(params)
    comprobar_unicidad_calendario(calendario.nombre)
    @calendarios[calendario.nombre] = calendario
  end

  def comprobar_unicidad_calendario(nombre)
    raise ExcepcionUnicidadEvento if @calendarios.key?(nombre)
  end

  def obtener_calendario(nombre)
    @calendarios[nombre]
  end

  def eliminar_calendario(nombre)
    @calendarios.delete(nombre)
  end

end