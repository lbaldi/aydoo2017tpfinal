require 'rspec'
require_relative '../model/calendario'

describe 'Calendario' do
  it 'Se deberia crear a partir de un nombre' do
    nombre_calendario = 'Calendario 1'
    Calendario.new(nombre_calendario)
  end

  it 'Deberia guardar el nombre con el cual se crea' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect(calendario.nombre).to eq nombre_calendario
  end

  it 'Error al crear un calendario sin nombre' do
    expect do
      Calendario.new('')
    end.to raise_error(ExcepcionNombreCalendario)
  end

  it 'Error al editar nombre' do
    nombre_calendario = 'Nombre Calendario'
    nuevo_nombre_calendario = 'Nuevo Nombre'
    calendario = Calendario.new(nombre_calendario)
    expect { calendario.nombre = nuevo_nombre_calendario }.to raise_error
  end

  it 'Debe poder almacenar un evento' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    intervalo = DateTime.now..DateTime.now
    allow(evento).to receive(:obtener_intervalo).and_return(intervalo)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
  end

  it 'Error al almacenar eventos que se solapen' do
    # Suponiendo que DateTime.now es Lunes
    # El caso de solapamiento planteado seria
    # el siguiente:
    # ( LUNES..MARTES , MARTES..JUEVES, MIERCOLES..VIERNES)
    intervalo_primer_evento = DateTime.now..(DateTime.now + 1)
    intervalo_segundo_evento = (DateTime.now + 1)..(DateTime.now + 3)
    intervalo_tercer_evento = (DateTime.now + 2)..(DateTime.now + 4)
    nombre_calendario = 'Calendario 1'
    primer_evento = double('Evento 1')
    allow(primer_evento).to receive(:id).and_return('id_1')
    allow(primer_evento).to receive(:obtener_intervalo).and_return(intervalo_primer_evento)
    segundo_evento = double('Evento 2')
    allow(segundo_evento).to receive(:id).and_return('id_2')
    allow(segundo_evento).to receive(:obtener_intervalo).and_return(intervalo_segundo_evento)
    tercer_evento = double('Evento 3')
    allow(tercer_evento).to receive(:id).and_return('id_3')
    allow(tercer_evento).to receive(:obtener_intervalo).and_return(intervalo_tercer_evento)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(primer_evento)
    calendario.almacenar_evento(segundo_evento)
    expect {
      calendario.almacenar_evento(tercer_evento)
    }.to raise_error(ExcepcionSolapamientoEvento)
  end

  it 'Debe poder almacenar dos eventos mientras no se solapen' do
    nombre_calendario = 'Calendario 1'
    intervalo_evento = DateTime.now..DateTime.now
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    allow(evento).to receive(:obtener_intervalo).and_return(intervalo_evento)
    intervalo_otro_evento = (DateTime.now + 1)..(DateTime.now + 1)
    otro_evento = double('Evento 2')
    allow(otro_evento).to receive(:id).and_return('id_2')
    allow(otro_evento).to receive(:obtener_intervalo).and_return(intervalo_otro_evento)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    calendario.almacenar_evento(otro_evento)
  end

  it 'Debe poder varios eventos mientras no se solapen' do
    nombre_calendario = 'Calendario 1'
    intervalo_primer_evento = DateTime.now..DateTime.now
    primer_evento = double('Evento 1')
    allow(primer_evento).to receive(:id).and_return('id_1')
    allow(primer_evento).to receive(:obtener_intervalo).and_return(intervalo_primer_evento)
    intervalo_segundo_evento = (DateTime.now + 1)..(DateTime.now + 1)
    segundo_evento = double('Evento 2')
    allow(segundo_evento).to receive(:id).and_return('id_2')
    allow(segundo_evento).to receive(:obtener_intervalo).and_return(intervalo_segundo_evento)
    intervalo_tercer_evento = (DateTime.now + 2)..(DateTime.now + 2)
    tercer_evento = double('Evento 3')
    allow(tercer_evento).to receive(:id).and_return('id_3')
    allow(tercer_evento).to receive(:obtener_intervalo).and_return(intervalo_tercer_evento)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(primer_evento)
    calendario.almacenar_evento(segundo_evento)
    calendario.almacenar_evento(tercer_evento)
  end

  it 'Error al crear un evento con mismo id que uno existente' do
    nombre_calendario = 'Calendario 1'
    evento = double('Evento 1')
    intervalo = DateTime.now..DateTime.now
    allow(evento).to receive(:id).and_return('id_1')
    allow(evento).to receive(:obtener_intervalo).and_return(intervalo)
    otro_evento = double('Evento 2')
    allow(otro_evento).to receive(:id).and_return('id_1')
    allow(otro_evento).to receive(:obtener_intervalo).and_return(intervalo)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    expect do
      calendario.almacenar_evento(otro_evento)
    end.to raise_error(ExcepcionUnicidadEvento)
  end

  it 'Deberia poder obtener un evento existente' do
    nombre_calendario = 'Calendario 1'
    intervalo = DateTime.now..DateTime.now
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    allow(evento).to receive(:obtener_intervalo).and_return(intervalo)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    expect(calendario.obtener_evento(evento.id)).to eq evento
  end

  it 'Error al obtener un evento inexistente' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect do
      calendario.obtener_evento('inexistente')
    end.to raise_error(ExcepcionEventoInexistente)
  end

  it 'Deberia poder eliminar un evento existente' do
    nombre_calendario = 'Calendario 1'
    intervalo = DateTime.now..DateTime.now
    evento = double('Evento 1')
    allow(evento).to receive(:id).and_return('id_1')
    allow(evento).to receive(:obtener_intervalo).and_return(intervalo)
    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(evento)
    calendario.eliminar_evento(evento.id)
  end

  it 'Error al eliminar un evento inexistente' do
    nombre_calendario = 'Calendario 1'
    calendario = Calendario.new(nombre_calendario)
    expect do
      calendario.eliminar_evento('inexistente')
    end.to raise_error(ExcepcionEventoInexistente)
  end

  it 'Deberia poder almacenar dos eventos recurrentes que no se solapen' do
    # Suponiendo que hoy es Lunes 01
    # Evento 1:
    #   inicia: Lunes 01 HH:MM:SS
    #   finaliza: Martes 02 HH:MM:SS
    #   Tiene una recurrencia semanal con fin: Lunes 15
    #   Por lo que tendremos Lunes 01 HH:MM:SS - Martes 02 HH:MM:SS
    #                        Lunes 08 HH:MM:SS - Martes 09 HH:MM:SS
    #                        Lunes 15 HH:MM:SS - Martes 16 HH:MM:SS
    # Evento 2:
    #   inicia: Jueves 04 HH:MM:SS
    #   finaliza: Viernes 05 HH:MM:SS
    #   Tiene una recurrencia semanal con fin: Jueves 11
    #   Por lo que tendremos Jueves 04 HH:MM:SS - Viernes 05 HH:MM:SS
    #                        Jueves 11 HH:MM:SS - Viernes 12 HH:MM:SS
    nombre_calendario = 'Calendario 1'

    dia_lunes_01 = DateTime.now
    dia_martes_02 = dia_lunes_01 + 1
    dia_lunes_08 = dia_lunes_01 + 7
    dia_martes_09 = dia_martes_02 + 7
    dia_lunes_15 = dia_lunes_08 + 7
    dia_martes_16 = dia_martes_09 + 7

    intervalo_primer_evento = [
      dia_lunes_01..dia_martes_02,
      dia_lunes_08..dia_martes_09,
      dia_lunes_15..dia_martes_16
    ]
    primer_evento = double('Evento 1')
    allow(primer_evento).to receive(:id).and_return('id_1')
    allow(primer_evento).to receive(:obtener_intervalo).and_return(intervalo_primer_evento)


    dia_jueves_04 = DateTime.now + 3
    dia_viernes_05 = dia_jueves_04 + 1
    dia_jueves_11 = dia_jueves_04 + 7
    dia_viernes_12 = dia_viernes_05 + 7

    intervalo_segundo_evento = [
      dia_jueves_04..dia_viernes_05,
      dia_jueves_11..dia_viernes_12
    ]
    segundo_evento = double('Evento 2')
    allow(segundo_evento).to receive(:id).and_return('id_2')
    allow(segundo_evento).to receive(:obtener_intervalo).and_return(intervalo_segundo_evento)

    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(primer_evento)
    calendario.almacenar_evento(segundo_evento)
  end

  it 'Error al almacenar dos eventos que se solapen uno de ellos recurrente' do
    # Suponiendo que hoy es Lunes 01
    # Evento 1:
    #   inicia: Lunes 01 HH:MM:SS
    #   finaliza: Martes 02 HH:MM:SS
    #   Tiene una recurrencia semanal con fin: Lunes 15
    #   Por lo que tendremos Lunes 01 HH:MM:SS - Martes 02 HH:MM:SS
    #                        Lunes 08 HH:MM:SS - Martes 09 HH:MM:SS
    #                        Lunes 15 HH:MM:SS - Martes 16 HH:MM:SS
    # Evento 2:
    #   inicia: Martes 09 HH:MM:SS
    #   finaliza: Miercoles 10 HH:MM:SS
    nombre_calendario = 'Calendario 1'

    dia_lunes_01 = DateTime.now
    dia_martes_02 = dia_lunes_01 + 1
    dia_lunes_08 = dia_lunes_01 + 7
    dia_martes_09 = dia_martes_02 + 7
    dia_lunes_15 = dia_lunes_08 + 7
    dia_martes_16 = dia_martes_09 + 7

    intervalo_primer_evento = [
        dia_lunes_01..dia_martes_02,
        dia_lunes_08..dia_martes_09,
        dia_lunes_15..dia_martes_16
    ]
    primer_evento = double('Evento 1')
    allow(primer_evento).to receive(:id).and_return('id_1')
    allow(primer_evento).to receive(:obtener_intervalo).and_return(intervalo_primer_evento)

    dia_miercoles_10 = dia_martes_09 + 1

    intervalo_segundo_evento = dia_martes_09..dia_miercoles_10

    segundo_evento = double('Evento 2')
    allow(segundo_evento).to receive(:id).and_return('id_2')
    allow(segundo_evento).to receive(:obtener_intervalo).and_return(intervalo_segundo_evento)

    calendario = Calendario.new(nombre_calendario)
    calendario.almacenar_evento(primer_evento)
    expect do
      calendario.almacenar_evento(segundo_evento)
    end.to raise_error(ExcepcionSolapamientoEvento)
  end
end