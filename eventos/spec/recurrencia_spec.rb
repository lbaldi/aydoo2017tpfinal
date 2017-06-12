require 'rspec'

require_relative '../model/recurrencia'

describe 'Recurrencia' do

  it 'Se debe crear una recurrencia a partir de una frecuencia y un fin' do
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    Recurrencia.new(frecuencia, fin_recurrencia)
  end

  it 'Deberia guardar la frecuencia con la que se crea' do
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    expect(recurrencia.frecuencia).to eq frecuencia
  end

end