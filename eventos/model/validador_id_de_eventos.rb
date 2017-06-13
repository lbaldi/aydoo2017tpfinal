require_relative '../model/repositorio_calendarios'
require_relative '../model/excepcion_unicidad_global_evento'

# Encargado de validar la unicidad global del id de un evento
# Ver otra forma de obtener los eventos

class ValidadorIdDeEventos

  def self.comprobar_unicidad_global_de_evento_por_id(id_evento)
    calendarios = RepositorioCalendarios.obtener_lista_calendarios
    calendarios.values.each do |calendario|
      calendario.eventos.values.each do |evento|
        raise ExcepcionUnicidadGlobalEvento if evento.id == id_evento
      end
    end
  end
end