require 'rspec'
require_relative '../model/evento'

describe 'Evento' do
  it 'Se debe crear a partir de un id, nombre, inicio y fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    Evento.new(id, nombre, inicio, fin)
  end

  it 'Deberia poder obtener el id' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.id).to eq id
  end

  it 'Error al intentar modificar el id' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect { evento.id = 'nuevo_id' }.to raise_error
  end

  it 'Deberia poder obtener el nombre' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.nombre).to eq nombre
  end

  it 'Deberia poder obtener el inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.inicio).to eq inicio
  end

  it 'Deberia poder obtener el fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    expect(evento.fin).to eq fin
  end

  it 'Deberia poder modificar su nombre' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    nuevo_nombre = 'nuevo_nombre'
    evento.nombre = nuevo_nombre
    expect(evento.nombre).to eq nuevo_nombre
  end

  it 'Deberia poder modificar su inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    nuevo_inicio = inicio - 1
    evento.inicio = nuevo_inicio
  end

  it 'Deberia poder modificar su fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    nuevo_fin = fin + 1
    evento.fin = nuevo_fin
  end

  it 'Error al crear un evento con fecha fin menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio - 1
    expect do
      Evento.new(id, nombre, inicio, fin)
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar fecha fin y que fecha fin sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    nuevo_fin = inicio - 1
    expect do
      evento.fin = nuevo_fin
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar fecha inicio y que fecha fin sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    evento = Evento.new(id, nombre, inicio, fin)
    nuevo_inicio = inicio + 1
    expect do
      evento.inicio = nuevo_inicio
    end.to raise_error(ExcepcionIntervaloErroneo)
  end
end