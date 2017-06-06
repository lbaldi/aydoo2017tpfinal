require 'rspec'
require_relative '../model/evento'

describe 'Evento' do
  it 'Crear un evento a partir de un id, nombre, inicio y fin' do
    Evento.new(
        'Evento 1',
        'id_1',
        '2017-03-31T18:00:00-03:00',
        '2017-04-31T18:00:00-03:00',
    )
  end
end