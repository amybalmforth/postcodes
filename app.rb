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
    @whitelist = Whitelist.new
    @result = Result.new(@postcode, @whitelist)
    @show = @result.show_data
    @lsoa = @result.find_lsoa(@show)
    session[:show] = @show
    session[:lsoa] = @lsoa
    session[:whitelist] = @whitelist
    redirect '/results'
  end

  get '/results' do
    @show = session[:show]
    @lsoa = session[:lsoa]
    @whitelist = session[:whitelist]
    @final_result = @whitelist.check_lsoa
    p @final_lsoa
    erb :results
  end

  run! if app_file == $0

end
