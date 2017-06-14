require_relative '../model/excepcion_intervalo_maximo'

MAXIMO_HORAS = 72

# Contiene la regla de negocio para el intervalo
# entre el inicio y fin de un evento
class ReglaIntervaloEvento
  def self.validar_horas(horas)
    raise ExcepcionIntervaloMaximo unless horas < MAXIMO_HORAS
  end
end