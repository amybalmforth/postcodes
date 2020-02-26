require 'sinatra/base'
require './models/postcode'

class PostcodeApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/get_postcode' do
    @postcode = Postcode.new(params[:my_postcode])
    @whitelist = Whitelist.new('Southwark', 'Lambeth')
    @result = Result.new(@postcode, @whitelist)
    @show = @result.show_data
    @lsoa = @result.find_lsoa(@show)
    session[:my_postcode] = @postcode.my_postcode
    session[:show] = @show
    session[:lsoa] = @lsoa
    session[:whitelist] = @whitelist
    redirect '/results'
  end

  get '/results' do
    @my_postcode = session[:my_postcode]
    @show = session[:show]
    @lsoa = session[:lsoa]
    @whitelist = session[:whitelist]
    @final_result = @whitelist.check_lsoa
    erb :results
  end

  run! if app_file == $PROGRAM_NAME
end
