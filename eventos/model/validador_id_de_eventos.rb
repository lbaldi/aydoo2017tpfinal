require_relative '../model/excepcion_unicidad_global_evento'

# Encargado de validar la unicidad global del id de un evento
class ValidadorIdDeEventos
  def self.comprobar(repositorio_calendarios, id_evento)
    repositorio_calendarios.calendarios.values.each do |calendario|
      calendario.eventos.key?(id_evento) && raise(ExcepcionUnicidadGlobalEvento)
    end
  end
end