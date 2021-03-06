require 'httparty'
require_relative 'result'
require_relative 'whitelist'

class Postcode
  attr_reader :my_postcode, :data, :response

  def initialize(my_postcode)
    @my_postcode = my_postcode
    @response = HTTParty.get('http://postcodes.io/postcodes'\
      "/#{my_postcode.gsub(/\s+/, '')}")
    @data = JSON.parse(@response.body)
  end
end
