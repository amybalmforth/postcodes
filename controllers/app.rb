require 'sinatra/base'
require 'sinatra/json'

class PostcodeApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/json' do
    json text: 'This is a test json!'
  end

  run! if app_file == $0

end
