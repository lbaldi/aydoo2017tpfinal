NOMBRE_ARCHIVO = 'repositorio.txt'.freeze

# Encargada de la persistencia del repositorio
class ArchivadorRepositorio
  def self.cargar
    if File.file?(NOMBRE_ARCHIVO)
      archivo= File.open(NOMBRE_ARCHIVO, "r")
      Marshal.load(archivo)
    end
  end

  def self.guardar(repositorio)
    archivo = File.open(NOMBRE_ARCHIVO, "w")
    Marshal.dump(repositorio, archivo)
    archivo.close
  end
end