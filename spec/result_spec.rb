require './models/result'
require './models/postcode'

describe Result do
  let(:postcode) { double :postcode }
  let(:result) { double :result }
  my_hash = { 'status' => 200, 'result' => { 'postcode' => 'SG4 7BH', 'quality' => 1, 'eastings' => 525_799, 'northings' => 229_833, 'country' => 'England', 'nhs_ha' => 'East of England', 'longitude' => -0.17086, 'latitude' => 51.952768, 'european_electoral_region' => 'Eastern', 'primary_care_trust' => 'Hertfordshire', 'region' => 'East of England', 'lsoa' => 'North Hertfordshire 005G', 'msoa' => 'North Hertfordshire 005', 'incode' => '7BH', 'outcode' => 'SG4', 'parliamentary_constituency' => 'North East Hertfordshire', 'admin_district' => 'North Hertfordshire', 'parish' => 'Weston', 'admin_county' => 'Hertfordshire', 'admin_ward' => 'Weston and Sandon', 'ced' => 'Royston West & Rural', 'ccg' => 'NHS East and North Hertfordshire', 'nuts' => 'Hertfordshire', 'codes' => { 'admin_district' => 'E07000099', 'admin_county' => 'E10000015', 'admin_ward' => 'E05004784', 'parish' => 'E04012229', 'parliamentary_constituency' => 'E14000845', 'ccg' => 'E38000049', 'ccg_id' => '06K', 'ced' => 'E58000659', 'nuts' => 'UKH23' } } }
  before do
    allow(postcode).to receive(:data).and_return(my_hash)
    allow(result).to receive(:show_data).and_return(my_hash)
  end

  describe 'show_data method' do
    it 'shows ruby hash as data' do
      expect(postcode.data).to eq my_hash
    end

    it 'shows ruby hash with show_data method' do
      expect(result.show_data).to eq my_hash
    end
  end
  describe 'find_lsoa method' do
    invalid_postcode = {"status"=>404, "error"=>"Invalid postcode"}
    it 'can check if valid postcode' do
      allow(result).to receive(:find_lsoa).and_return('Invalid postcode')
      expect(result.find_lsoa(invalid_postcode)).to eq 'Invalid postcode'
    end

    it 'finds the lsoa' do
      allow(result).to receive(:find_lsoa).and_return('North Hertfordshire 005G')
      expect(result.find_lsoa(my_hash)).to eq 'North Hertfordshire 005G'
    end

    it 'assigns the lsoa' do
      allow(result).to receive(:lsoa).and_return('North Hertfordshire 005G')
      expect(result.lsoa).to eq 'North Hertfordshire 005G'
    end
  end
end
