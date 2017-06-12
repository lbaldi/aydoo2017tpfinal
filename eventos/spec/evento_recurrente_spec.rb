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

  it 'Se debe poder obtener la recurrencia con la que se creo el evento recurrente' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect(evento_recurrente.recurrencia).to eq recurrencia
  end


  it 'Deberia poder obtener el id' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect(evento_recurrente.id).to eq id
  end

  it 'Error al intentar modificar el id' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect { evento_recurrente.id = 'nuevo_id' }.to raise_error
  end

  it 'Deberia poder obtener el nombre' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect(evento_recurrente.nombre).to eq nombre
  end

  it 'Deberia poder obtener el inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect(evento_recurrente.inicio).to eq inicio
  end

  it 'Deberia poder obtener el fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect(evento_recurrente.fin).to eq fin
  end

  it 'Deberia poder obtener el intervalo del evento' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    expect(evento_recurrente.obtener_intervalo).to eq inicio..fin
  end

  it 'Deberia poder modificar su nombre' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    nuevo_nombre = 'nuevo_nombre'
    evento_recurrente.nombre = nuevo_nombre
    expect(evento_recurrente.nombre).to eq nuevo_nombre
  end

  it 'Deberia poder modificar su inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    un_dia = 1
    nuevo_inicio = inicio - un_dia
    evento_recurrente.inicio = nuevo_inicio
  end

  it 'Deberia poder modificar su fin' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    un_dia = 1
    nuevo_fin = fin + un_dia
    evento_recurrente.fin = nuevo_fin
  end

  it 'Error al crear un evento con fin menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    un_dia = 1
    fin = inicio - un_dia
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    expect do
      EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar fin y que fin sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    un_dia = 1
    nuevo_fin = inicio - un_dia
    expect do
      evento_recurrente.fin = nuevo_fin
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar inicio y que fin sea menor a inicio' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    un_dia = 1
    nuevo_inicio = inicio + un_dia
    expect do
      evento_recurrente.inicio = nuevo_inicio
    end.to raise_error(ExcepcionIntervaloErroneo)
  end

  it 'Error al modificar inicio e intervalo supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    tres_dias = 3
    nuevo_inicio = inicio - tres_dias
    expect do
      evento_recurrente.inicio = nuevo_inicio
    end.to raise_error(ExcepcionIntervaloMaximo)
  end

  it 'Error al modificar fin e intervalo supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    tres_dias = 3
    nuevo_fin = inicio + tres_dias
    expect do
      evento_recurrente.fin = nuevo_fin
    end.to raise_error(ExcepcionIntervaloMaximo)
  end

  it 'Deberia poder modificar fin e intervalo no supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    casi_tres_dias = 2.99
    nuevo_fin = inicio + casi_tres_dias
    evento_recurrente.fin = nuevo_fin
  end

  it 'Deberia poder modificar inicio e intervalo no supere maximo' do
    id = 'id_1'
    nombre = 'Evento 1'
    inicio = DateTime.now
    fin = inicio
    frecuencia = 'semanal'
    fin_recurrencia = DateTime.now + 30
    recurrencia = Recurrencia.new(frecuencia, fin_recurrencia)
    evento_recurrente = EventoRecurrente.new(id, nombre, inicio, fin, recurrencia)
    casi_tres_dias = 2.99
    nuevo_inicio = inicio - casi_tres_dias
    evento_recurrente.inicio = nuevo_inicio
  end
end