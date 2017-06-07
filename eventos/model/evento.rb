# Representa un evento. Limitado por
# un inicio y un fin, puede que el mismo
# posea o no una recurrencia.
class Evento
  attr_reader :id
  attr_accessor :nombre, :inicio, :fin, :recurrencia

  def initialize(params)
    validar_parametros(params)
    @id = params[:id]
    @nombre = params[:nombre]
    @inicio = params[:inicio]
    @fin = params[:fin]
    @recurrencia = params[:recurrencia]
  end

  def validar_recurrencia(params)
    raise TypeError unless params.is_a? Hash
    raise TypeError unless params[:frecuencia].is_a? String
    raise TypeError unless params[:fin].is_a? DateTime
  end

  def validar_parametros(params)
    raise TypeError unless params.is_a? Hash
    raise TypeError unless params[:id].is_a? String
    raise TypeError unless params[:nombre].is_a? String
    raise TypeError unless params[:inicio].is_a? DateTime
    raise TypeError unless params[:fin].is_a? DateTime
    params[:recurrencia] && validar_recurrencia(params[:recurrencia])
  end
end