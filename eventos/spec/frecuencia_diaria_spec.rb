require 'rspec'
require_relative '../model/frecuencia_diaria'

describe 'Frecuencia Diaria' do
  it 'deberia devolver 1 al pedirle la frecuencia' do
    expect(FrecuenciaDiaria.new.frecuencia). to eq 1
  end
end