require 'rspec'
require_relative '../model/evento_recurrente'
require_relative '../model/recurrencia'

describe 'Evento Recurrente' do

  it 'Se debe crear un evento recurrente a partid de un id, nombre, inicio, fin, y recurrencia' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
  end
end