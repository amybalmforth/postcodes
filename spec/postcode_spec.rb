require './models/postcode'

describe Postcode do
  let(:postcode) { described_class.new('SE17QD') }
  describe 'create new instance of postcode class' do
    it 'is instance of postcode class' do
      expect(postcode).to be_a Postcode
    end

    it 'postcode given as argument' do
      expect(postcode.my_postcode).to eq 'SE17QD'
    end
  end
end
