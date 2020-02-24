require 'sinatra/base'

class Postcode < Sinatra::Base

  get '/' do
    'Wee!'
  end

  run! if app_file == $0

end
