require './models/postcode'

describe Postcode do
  let(:postcode) { double :postcode }
  before do
    allow(postcode).to receive(:my_postcode).and_return('SE17QD')
  end
  describe 'create new instance of postcode class' do
    it 'postcode given as argument' do
      expect(postcode.my_postcode).to eq 'SE17QD'
    end
  end
end
