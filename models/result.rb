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
      @lsoa = data.dig('result', 'lsoa')
      @whitelist.final_lsoa = nil
      'Invalid postcode'
    else
      @lsoa = data.dig('result', 'lsoa')
      @whitelist.final_lsoa = @lsoa
    end
  end
end
