require 'rspec'
require_relative '../model/regla_intervalo_evento'

describe 'Regla Intervalo Evento' do
  it 'Deberia validar un intervalo menos a 72 horas' do
    ReglaIntervaloEvento.validar_horas(71.99)
  end

  it 'Error al intentar validar un intervalo de 72 horas' do
    expect do
      ReglaIntervaloEvento.validar_horas(72)
    end.to raise_error(ExcepcionIntervaloMaximo)
  end

  it 'Error al intentar validar un intervalo de 73 horas' do
    expect do
      ReglaIntervaloEvento.validar_horas(73)
    end.to raise_error(ExcepcionIntervaloMaximo)
  end
end