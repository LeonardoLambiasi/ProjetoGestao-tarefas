require 'sinatra'

set :port, 9090
set :bind, '0.0.0.0'

get '/' do
    redirect '/index.html'
end

get '/list' do
    activities = File.open("dados.txt", "r"){ |file| file.read }
    activities
end

post '/add' do
    @name = params[:name]
    File.open('dados.txt', 'a') do |f|
        f << @name << "\n"
    end
    200
end
