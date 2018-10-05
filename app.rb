require_relative 'config/environment'

class App < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "learn_sinatra"
  end

  get '/' do
    erb :index
  end

  post '/checkout' do
    purchases = Purchase.new(params)
    @purchases = purchases.collect do |item|
      item
    end
    erb :checkout
  end

  get '/sets' do
    @session = session
  end
  
end
