require 'rspec'
require_relative '../model/calendar'

describe 'Calendario' do
  it 'Crear un calendario a partir de un nombre' do
    Calendar.new('Calendario 1')
  end
end