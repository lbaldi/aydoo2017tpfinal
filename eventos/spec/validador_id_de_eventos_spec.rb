require 'rspec'
require_relative '../model/validador_id_de_eventos'

describe 'Validador de ID de eventos global' do

  it 'Se intenta validar un id en un repositorio sin calendarios' do
    evento = double('Evento')
    repositorio = double('Repositorio')
    allow(repositorio).to receive(:calendarios).and_return({})
    allow(evento).to receive(:id).and_return('id_1')
    ValidadorIdDeEventos.comprobar(repositorio, evento.id)
  end

  it 'Se intenta validar un id en un repositorio con un calendario sin eventos' do
    evento = double('Evento')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = double('Calendario')
    allow(calendario).to receive(:eventos).and_return({})
    repositorio = double('Repositorio')
    allow(repositorio).to receive(:calendarios).and_return({id: calendario})
    ValidadorIdDeEventos.comprobar(repositorio, evento.id)
  end

  it 'Error al validar un id existente' do
    evento = double('Evento')
    allow(evento).to receive(:id).and_return('id_1')
    calendario = double('Calendario')
    allow(calendario).to receive(:eventos).and_return({"id_1" => evento})
    repositorio = double('Repositorio')
    allow(repositorio).to receive(:calendarios).and_return({id: calendario})
    expect{
      ValidadorIdDeEventos.comprobar(repositorio, evento.id)
    }.to raise_error(ExcepcionUnicidadGlobalEvento)
  end
end