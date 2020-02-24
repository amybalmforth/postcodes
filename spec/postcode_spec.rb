require './models/postcode'

describe Postcode do
  let(:postcode) { described_class.new }
  describe 'create new instance of postcode class' do
    it 'is instance of postcode class' do
      expect(postcode).to be_a Postcode
    end
  end
end
