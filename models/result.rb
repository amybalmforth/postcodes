require 'httparty'
require 'ruby_dig'
require_relative 'postcode'

class Result

  def initialize(postcode = Postcode.new(my_postcode))
    @postcode = postcode
  end

  def show_data
    @postcode.data
  end

  def find_lsoa(data)
    if data.dig('status') == 404
      return 'Invalid postcode'
    else
      data.dig('result', 'lsoa')
    end
  end



end
