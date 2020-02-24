require 'httparty'
require_relative 'postcode'

class Result

  def initialize(postcode = Postcode.new(my_postcode))
    @postcode = postcode
  end

  def show_data
    @postcode.data
  end


end
