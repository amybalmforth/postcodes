require 'sinatra/base'
require 'sinatra/json'
require './models/postcode'

class PostcodeApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  # get '/json' do
  #   json text: 'This is a test json!'
  # end

  post '/get_postcode' do
    @postcode = Postcode.new(params[:my_postcode])
    @result = Result.new(@postcode)
    @show = @result.show_data
    session[:my_postcode] = params[:my_postcode]
    redirect '/results'
  end

  get '/results' do
    @my_postcode = session[:my_postcode]
    erb :results
  end

  run! if app_file == $0

end
