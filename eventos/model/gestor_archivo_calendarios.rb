NOMBRE_ARCHIVO_CALENDARIOS = 'calendarios'.freeze

# Encargada de leer y escribir el archivo de calendarios
class GestorArchivoCalendarios

  def self.leer_calendarios_en_disco
    if File.file?(NOMBRE_ARCHIVO_CALENDARIOS)
      archivo_calendarios = File.open(NOMBRE_ARCHIVO_CALENDARIOS, "r")
      Marshal.load(archivo_calendarios)
    end
  end

  def self.guardar_calendarios_en_disco(calendarios)
    archivo_calendarios = File.open(NOMBRE_ARCHIVO_CALENDARIOS, "w")
    Marshal.dump(calendarios, archivo_calendarios)
    archivo_calendarios.close
  end

  def self.eliminar_calendarios_en_disco
    File.delete(NOMBRE_ARCHIVO_CALENDARIOS) if File.exist?(NOMBRE_ARCHIVO_CALENDARIOS)
  end
end