require_relative 'postcode'
require_relative 'result'

class Whitelist
  attr_accessor :final_lsoa, :accepted_lsoa_1, :accepted_lsoa_2

  def initialize(*)
    @final_lsoa = final_lsoa
    @accepted_lsoa1 = 'Southwark'
    @accepted_lsoa2 = 'Lambeth'
  end

  def assign_lsoa(test_lsoa)
    @final_lsoa = test_lsoa
  end

  def check_lsoa
    return 'Invalid postcode' if @final_lsoa.nil?

    array = @final_lsoa.split(' ')
    return 'This postcode is servable' if array[0] == @accepted_lsoa1 || \
                                          array[0] == @accepted_lsoa2

    'This postcode is not servable'
  end
end
