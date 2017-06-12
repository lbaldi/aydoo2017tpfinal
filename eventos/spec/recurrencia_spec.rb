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

  it 'No deberia permitir crear una recurrencia con una frecuencia no definida' do
    frecuencia = ''
    fin_recurrencia = DateTime.now + 30
    expect { Recurrencia.new(frecuencia, fin_recurrencia) }.to raise_error(ExcepcionFrecuenciaNoDefinida)
  end

end