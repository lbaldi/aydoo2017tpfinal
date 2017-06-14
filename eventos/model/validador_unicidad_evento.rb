require_relative '../model/excepcion_unicidad_global_evento'

# Encargado de validar la unicidad global de un evento
class ValidadorUnicidadEvento
  def self.validar(repositorio, id_evento)
    repositorio.calendarios.values.each do |calendario|
      calendario.eventos.key?(id_evento) && raise(ExcepcionUnicidadGlobalEvento)
    end
  end
end