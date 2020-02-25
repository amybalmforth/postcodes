require './models/result'
require './models/postcode'
require './models/whitelist'

describe Whitelist do

  let(:postcode) { double :postcode }
  let(:result) { double :result }
  let(:whitelist) { double :whitelist }

  my_response = { 'status' => 200, 'result' => { 'postcode' => 'SG4 7BH', 'quality' => 1, 'eastings' => 525_799, 'northings' => 229_833, 'country' => 'England', 'nhs_ha' => 'East of England', 'longitude' => -0.17086, 'latitude' => 51.952768, 'european_electoral_region' => 'Eastern', 'primary_care_trust' => 'Hertfordshire', 'region' => 'East of England', 'lsoa' => 'North Hertfordshire 005G', 'msoa' => 'North Hertfordshire 005', 'incode' => '7BH', 'outcode' => 'SG4', 'parliamentary_constituency' => 'North East Hertfordshire', 'admin_district' => 'North Hertfordshire', 'parish' => 'Weston', 'admin_county' => 'Hertfordshire', 'admin_ward' => 'Weston and Sandon', 'ced' => 'Royston West & Rural', 'ccg' => 'NHS East and North Hertfordshire', 'nuts' => 'Hertfordshire', 'codes' => { 'admin_district' => 'E07000099', 'admin_county' => 'E10000015', 'admin_ward' => 'E05004784', 'parish' => 'E04012229', 'parliamentary_constituency' => 'E14000845', 'ccg' => 'E38000049', 'ccg_id' => '06K', 'ced' => 'E58000659', 'nuts' => 'UKH23' } } }
  my_hash = { 'status' => 200, 'result' => { 'postcode' => 'SG4 7BH', 'quality' => 1, 'eastings' => 525_799, 'northings' => 229_833, 'country' => 'England', 'nhs_ha' => 'East of England', 'longitude' => -0.17086, 'latitude' => 51.952768, 'european_electoral_region' => 'Eastern', 'primary_care_trust' => 'Hertfordshire', 'region' => 'East of England', 'lsoa' => 'North Hertfordshire 005G', 'msoa' => 'North Hertfordshire 005', 'incode' => '7BH', 'outcode' => 'SG4', 'parliamentary_constituency' => 'North East Hertfordshire', 'admin_district' => 'North Hertfordshire', 'parish' => 'Weston', 'admin_county' => 'Hertfordshire', 'admin_ward' => 'Weston and Sandon', 'ced' => 'Royston West & Rural', 'ccg' => 'NHS East and North Hertfordshire', 'nuts' => 'Hertfordshire', 'codes' => { 'admin_district' => 'E07000099', 'admin_county' => 'E10000015', 'admin_ward' => 'E05004784', 'parish' => 'E04012229', 'parliamentary_constituency' => 'E14000845', 'ccg' => 'E38000049', 'ccg_id' => '06K', 'ced' => 'E58000659', 'nuts' => 'UKH23' } } }
  before do
    allow(postcode).to receive(:data).and_return(my_hash)
    allow(postcode).to receive(:response).and_return(my_response)
    allow(result).to receive(:whitelist).and_return(Whitelist.new)
  end

  describe 'create new instance of whitelist class' do
    it 'each result is initialized with a whitelist' do
      expect(result.whitelist).to be_a Whitelist
    end
  end

  describe 'checking if postcode is whitelisted' do
    it 'method decides if serviceable or not' do
      p result
    end
  end

  # describe 'find_lsoa method' do
  #   invalid_postcode = {"status"=>404, "error"=>"Invalid postcode"}
  #   it 'can check if valid postcode' do
  #     expect(result.find_lsoa(invalid_postcode)).to eq 'Invalid postcode'
  #   end
  # end
end
