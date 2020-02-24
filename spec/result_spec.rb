require './models/result'
require './models/postcode'

describe Result do
  let(:postcode) { Postcode.new('SE17QD') }
  let(:result) { described_class.new(postcode) }
  describe 'create new instance of result class' do
    it 'is instance of result class' do
      expect(result).to be_a Result
    end
  end
end
