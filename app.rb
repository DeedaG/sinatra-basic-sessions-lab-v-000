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
    purchases = Purchase.new(params[:item])
    @purchases = purchases.collect do |item|
      item
    end
    @session[:item] = (params[:item])
    erb :checkout
  end


end
