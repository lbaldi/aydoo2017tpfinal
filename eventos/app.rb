require 'json'
require 'sinatra'
require_relative 'model/repositorio_calendarios'

repositorio_calendarios = RepositorioCalendarios.new

post '/calendarios' do
  request.body.rewind
  begin
    request_payload = JSON.parse request.body.read
    nombre_calendario = request_payload['nombre']
    calendario = Calendario.new(nombre_calendario)
    repositorio_calendarios.almacenar_calendario(calendario)
  rescue ExcepcionUnicidadCalendario
    status 400
  rescue ExcepcionNombreCalendario
    status 400
  rescue
    status 417
  end

end

delete '/calendarios/:nombre' do
  params[:nombre]
end

get '/calendarios' do
end

get '/calendarios/:nombre' do
  params[:nombre]
end

post '/eventos' do
  request.body.read
end

put '/eventos' do
  request.body.read
end

delete '/eventos/:id' do
  params[:id]
end

get '/eventos' do
  params[:calendario]
end

get '/eventos/:id' do
  params[:id]
end