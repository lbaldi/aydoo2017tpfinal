require 'rspec'
require_relative '../model/evento_recurrente'

describe 'Evento Recurrente' do
  it 'Se debe crear un evento recurrente a partir de un id, nombre, inicio, fin, frecuencia y fin frecuencia' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now + 30
    EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
  end

  it 'Error al crear un evento con fin_recurrencia menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now - 1
    expect do
      EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Se debe poder obtener la frecuencia con la que se creo el evento recurrente' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now + 30
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    expect(evento_recurrente.frecuencia).to eq frecuencia
  end

  it 'Se debe poder obtener el fin de recurrencia con la que se creo el evento recurrente' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now + 30
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    expect(evento_recurrente.fin_recurrencia).to eq fin_recurrencia
  end

  it 'Deberia poder obtener el intervalo del evento' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now + 2
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    rango_esperado = [inicio..fin, (inicio + 1)..(fin + 1), (inicio + 2)..(fin + 2)]
    expect(evento_recurrente.obtener_intervalo).to eq rango_esperado
  end

  it 'Error al modificar inicio y que fin recurrencia sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now
    evento = EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    expect do
      evento.inicio = fin_recurrencia + 1
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar inicio y que fin recurrencia sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now
    evento = EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    expect do
      evento.inicio = fin_recurrencia + 1
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar fin recurrencia y que fin recurrencia sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = double('Frecuencia')
    allow(frecuencia).to receive(:frecuencia).and_return(1)
    fin_recurrencia = DateTime.now
    evento = EventoRecurrente.new(id, nombre, inicio, fin, frecuencia, fin_recurrencia)
    expect do
      evento.fin_recurrencia = inicio - 1
    end.to raise_error(ExcepcionIntervaloErroneo)
  end
end