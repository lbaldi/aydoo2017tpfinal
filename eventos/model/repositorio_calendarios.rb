require_relative '../model/calendario'
require_relative '../model/gestor_archivo_calendarios'
require_relative '../model/excepcion_unicidad_calendario'
require_relative '../model/excepcion_calendario_inexistente'

# Repositorio de calendarios
class RepositorioCalendarios
  attr_reader :calendarios

  def initialize
    @calendarios = obtener_lista_calendarios
  end

  def almacenar_calendario(calendario)
    identificacion = estandarizar_identificacion(calendario.nombre)
    comprobar_unicidad_calendario(identificacion)
    @calendarios[identificacion] = calendario
  end

  def obtener_calendario(identificacion)
    identificacion = estandarizar_identificacion(identificacion)
    @calendarios[identificacion] || raise(ExcepcionCalendarioInexistente)
  end

  def eliminar_calendario(identificacion)
    identificacion = estandarizar_identificacion(identificacion)
    unless @calendarios.delete(identificacion)
      raise ExcepcionCalendarioInexistente
    end
  end

  def obtener_lista_calendarios
    GestorArchivoCalendarios.leer_calendarios_en_disco || {}
  end

  def actualizar
    GestorArchivoCalendarios.guardar_calendarios_en_disco(calendarios)
  end

  private

  def comprobar_unicidad_calendario(identificacion)
    raise ExcepcionUnicidadCalendario if @calendarios.key?(identificacion)
  end

  def estandarizar_identificacion(identificacion)
    identificacion.downcase
  end

end