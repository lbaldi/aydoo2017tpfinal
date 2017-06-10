require 'sinatra'

post '/calendarios' do
  request.body.read
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