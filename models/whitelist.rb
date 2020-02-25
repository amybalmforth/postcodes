require 'ruby_dig'
require_relative 'postcode'
require_relative 'result'

class Whitelist
  attr_reader :final_lsoa

  def initialize
    @final_lsoa = final_lsoa
  end

  def assign_lsoa(test_lsoa)
    @final_lsoa = test_lsoa
  end

  def check_lsoa
    array = @final_lsoa.split(" ")
    if array[0] == 'Southwark' || array[0] == 'Lambeth'
      return 'This postcode is serviceable'
    else
      return 'This postcode is not serviceable'
    end
  end


end
