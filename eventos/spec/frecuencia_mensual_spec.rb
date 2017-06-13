require 'rspec'
require_relative '../model/frecuencia_mensual'

describe 'Frecuencia Mensual' do
  it 'deberia devolver 30 al pedirle la frecuencia' do
    dia = 24
    expect(FrecuenciaMensual.new.frecuencia). to eq 30 * dia
  end
end