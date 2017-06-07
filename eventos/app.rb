require 'sinatra'
require 'json'

$gestor_de_calendarios = Gestor_de_calendarios.new

post '/calendarios' do
  begin
    request.body.rewind
    data = JSON.parse request.body.read
    # Implementacion
    status 200
  rescue Exception
    status 400
  end
end

delete '/calendarios' do
  begin
    nombre = params[:nombre]
    # Implementacion
    status 200
  rescue Exception
    # No encontrado
    status 404
  end
end

get '/calendarios' do
  # Implementacion
  status 200
end

get '/calendarios' do
  begin
    nombre = params[:nombre]
    # Implementacion
    status 200
  rescue Exception
    # No encontrado
    status 404
  end
end

post '/eventos' do
  begin
    request.body.rewind
    data = JSON.parse request.body.read
    # Implementacion
    status 201
  rescue Exception
    status 400
  end
end

put '/eventos' do
  request.body.rewind
  data = JSON.parse request.body.read
  # Implementacion
  status 200
end

delete '/eventos/:id' do
  id_evento = params[:id]
  # Implementacion
  status 200
end

get '/eventos' do
  nombre_calendario = params[:calendario]
  # Implementacion
  puts nombre_calendario
  status 200
end

get '/eventos/:id' do
  id_evento = params[:id]
  # Implementacion
  status 200
end