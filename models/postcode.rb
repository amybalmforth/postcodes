require 'httparty'

class Postcode
  attr_reader :my_postcode, :data

  def initialize(my_postcode)
    @my_postcode = my_postcode
    @response = HTTParty.get("http://postcodes.io/postcodes/#{@my_postcode}")
    @data = JSON.parse(@response.body)
  end

end