require 'sinatra'
require 'sinatra/reloader'
require 'awesome_print'
get '/' do
  ips = %x{ ifconfig | grep 'inet ' | cut -d ' ' -f 2 }.split("\n")
  @url = "#{ips[1]}:#{request.port}"
  haml :index
end

post '/save' do
  file = params[:file]
  File.open("download/#{params[:title]}", 'wb') { |f| f.write(file) }
end

get '/fliner.js' do
  content_type "text/javascript"
  coffee :fliner
end

