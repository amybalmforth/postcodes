require 'httparty'
require 'ruby_dig'
require_relative 'postcode'
require_relative 'whitelist'

class Result
  attr_reader :lsoa, :whitelist

  def initialize(postcode = Postcode.new(my_postcode), whitelist = Whitelist.new)
    @postcode = postcode
    @whitelist = whitelist
    @lsoa = lsoa
  end

  def show_data
    @postcode.data
  end

  def find_lsoa(data)
    if data.dig('status') == 404
      return 'Invalid postcode'
    else
      @lsoa = data.dig('result', 'lsoa')
      @lsoa
    end
  end



end
