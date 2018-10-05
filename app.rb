require_relative 'config/environment'

class App < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/checkout' do
    purchases = Purchase.new(params[:item][:name])
    @purchases = purchases.collect do |item|
      item
    end
    erb :checkout
  end
end
