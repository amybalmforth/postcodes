require 'sinatra/base'
require 'sinatra/json'
require './models/postcode'
require './models/result'

class PostcodeApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/get_postcode' do
    @postcode = Postcode.new(params[:my_postcode])
    @result = Result.new(@postcode)
    @show = @result.show_data
    session[:show] = @show
    redirect '/results'
  end

  get '/results' do
    @show = session[:show]
    erb :results
  end

  run! if app_file == $0

end
