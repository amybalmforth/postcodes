## Description of the program

This is a web application which utilises the Postcodes API (​http://postcodes.io). The user can input and submit any postcode in the search box, the program will call the Postcodes API and use the payload to determine whether the given postcode is within a specific whitelist - returning either "Servable", "Not servable" or "Non-existant postcode".

#### Whitelisted postcodes:

- Defaulted to anything within the Lambeth and Southwark LSOAs but with option to change
- Option to whitelist additional specific postcodes which aren't tracked by the Postcodes API

### How it works

I built the program with three classes:

* Postcode class - Stores the input postcode, makes the API call with it, stores the HTTP response body

* Result class - Accesses the API response and extracts the LSOA details, assigns to Whitelist class

* Whitelist class - Pass in acceptable LSOAs on creation (default Southwark and Lambeth). Confirms if the LSOA is servable, non servable or not a valid postcode

I built a separate Whitelist class in case the user wishes to change the whitelist - this is defaulted to Southwark and Lambeth but different LSOAs can be passed in on creation of the class.

The part I feel could be improved is the point where the additional postcodes (not tracked by API) are checked. These are checked at the final stage in the view (results.erb). I feel it would be better if the check was done earlier, so given more time I would like to try and implement that, although at least this makes the additional postcodes fairly easy to change if needed.

The models are unit tested with Rspec and there are Capybara feature tests for each scenario (servable, non-servable and non-existant postcode)

### Instructions for setup, running tests and running application

```
$ git clone https://github.com/amybalmforth/postcodes.git
$ cd postcodes
$ bundle install
$ rspec
$ rubocop
$ rackup
$ visit in browser: http://localhost:9292
```

### Demonstration of how the code works in IRB

Servable postcode:
```
2.2.10 :001 > require './models/postcode.rb'
 => true
2.2.10 :002 > result = Result.new(postcode = Postcode.new('SW81HF'), whitelist = Whitelist.new('Southwark', 'Lambeth'))
 => #<Result:0x007fb9b2b09758 @postcode=#<Postcode:0x007fb9b2b20200 @my_postcode="SW81HF", @response=#<HTTParty::Response:0x7fb9b2b12290 parsed_response={"status"=>200, "result"=>{"postcode"=>"SW8 1HF", "quality"=>1, "eastings"=>530557, "northings"=>176726, "country"=>"England", "nhs_ha"=>"London", "longitude"=>-0.121543, "latitude"=>51.47444, "european_electoral_region"=>"London", "primary_care_trust"=>"Lambeth", "region"=>"London", "lsoa"=>"Lambeth 008D", "msoa"=>"Lambeth 008", "incode"=>"1HF", "outcode"=>"SW8", "parliamentary_constituency"=>"Vauxhall", "admin_district"=>"Lambeth", "parish"=>"Lambeth, unparished area", "admin_county"=>nil, "admin_ward"=>"Stockwell", "ced"=>nil, "ccg"=>"NHS Lambeth", "nuts"=>"Lambeth", "codes"=>{"admin_district"=>"E09000022", "admin_county"=>"E99999999", "admin_ward"=>"E05000429", "parish"=>"E43000212", "parliamentary_constituency"=>"E14001008", "ccg"=>"E38000092", "ccg_id"=>"08K", "ced"=>"E99999999", "nuts"=>"UKI45"}}}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"server"=>["nginx/1.14.0"], "date"=>["Wed, 26 Feb 2020 11:36:37 GMT"], "content-type"=>["application/json; charset=utf-8"], "content-length"=>["750"], "connection"=>["close"], "x-gnu"=>["Michael J Blanchard"], "access-control-allow-origin"=>["*"], "etag"=>["W/\"2ee-GwcdMCnREwL/k7OO3vru61WtFCA\""]}>, @data={"status"=>200, "result"=>{"postcode"=>"SW8 1HF", "quality"=>1, "eastings"=>530557, "northings"=>176726, "country"=>"England", "nhs_ha"=>"London", "longitude"=>-0.121543, "latitude"=>51.47444, "european_electoral_region"=>"London", "primary_care_trust"=>"Lambeth", "region"=>"London", "lsoa"=>"Lambeth 008D", "msoa"=>"Lambeth 008", "incode"=>"1HF", "outcode"=>"SW8", "parliamentary_constituency"=>"Vauxhall", "admin_district"=>"Lambeth", "parish"=>"Lambeth, unparished area", "admin_county"=>nil, "admin_ward"=>"Stockwell", "ced"=>nil, "ccg"=>"NHS Lambeth", "nuts"=>"Lambeth", "codes"=>{"admin_district"=>"E09000022", "admin_county"=>"E99999999", "admin_ward"=>"E05000429", "parish"=>"E43000212", "parliamentary_constituency"=>"E14001008", "ccg"=>"E38000092", "ccg_id"=>"08K", "ced"=>"E99999999", "nuts"=>"UKI45"}}}>, @whitelist=#<Whitelist:0x007fb9b2b097d0 @final_lsoa=nil>, @lsoa=nil>
2.2.10 :003 > data = result.show_data
 => {"status"=>200, "result"=>{"postcode"=>"SW8 1HF", "quality"=>1, "eastings"=>530557, "northings"=>176726, "country"=>"England", "nhs_ha"=>"London", "longitude"=>-0.121543, "latitude"=>51.47444, "european_electoral_region"=>"London", "primary_care_trust"=>"Lambeth", "region"=>"London", "lsoa"=>"Lambeth 008D", "msoa"=>"Lambeth 008", "incode"=>"1HF", "outcode"=>"SW8", "parliamentary_constituency"=>"Vauxhall", "admin_district"=>"Lambeth", "parish"=>"Lambeth, unparished area", "admin_county"=>nil, "admin_ward"=>"Stockwell", "ced"=>nil, "ccg"=>"NHS Lambeth", "nuts"=>"Lambeth", "codes"=>{"admin_district"=>"E09000022", "admin_county"=>"E99999999", "admin_ward"=>"E05000429", "parish"=>"E43000212", "parliamentary_constituency"=>"E14001008", "ccg"=>"E38000092", "ccg_id"=>"08K", "ced"=>"E99999999", "nuts"=>"UKI45"}}}
2.2.10 :004 > result.find_lsoa(data)
 => "Lambeth 008D"
2.2.10 :005 > whitelist.final_lsoa
 => "Lambeth 008D"
2.2.10 :006 > whitelist.check_lsoa
 => "This postcode is servable"
2.2.10 :007 >
```

Non-servable postcode:
```
2.2.10 :001 > require './models/postcode.rb'
 => true
2.2.10 :002 > result = Result.new(postcode = Postcode.new('SG47BH'), whitelist = Whitelist.new('Southwark', 'Lambeth'))
 => #<Result:0x007fca6dba5ba0 @postcode=#<Postcode:0x007fca6dbbc760 @my_postcode="SG47BH", @response=#<HTTParty::Response:0x7fca6dbac630 parsed_response={"status"=>200, "result"=>{"postcode"=>"SG4 7BH", "quality"=>1, "eastings"=>525799, "northings"=>229833, "country"=>"England", "nhs_ha"=>"East of England", "longitude"=>-0.17086, "latitude"=>51.952768, "european_electoral_region"=>"Eastern", "primary_care_trust"=>"Hertfordshire", "region"=>"East of England", "lsoa"=>"North Hertfordshire 005G", "msoa"=>"North Hertfordshire 005", "incode"=>"7BH", "outcode"=>"SG4", "parliamentary_constituency"=>"North East Hertfordshire", "admin_district"=>"North Hertfordshire", "parish"=>"Weston", "admin_county"=>"Hertfordshire", "admin_ward"=>"Weston and Sandon", "ced"=>"Royston West & Rural", "ccg"=>"NHS East and North Hertfordshire", "nuts"=>"Hertfordshire", "codes"=>{"admin_district"=>"E07000099", "admin_county"=>"E10000015", "admin_ward"=>"E05004784", "parish"=>"E04012229", "parliamentary_constituency"=>"E14000845", "ccg"=>"E38000049", "ccg_id"=>"06K", "ced"=>"E58000659", "nuts"=>"UKH23"}}}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"server"=>["nginx/1.14.0"], "date"=>["Tue, 25 Feb 2020 17:31:06 GMT"], "content-type"=>["application/json; charset=utf-8"], "content-length"=>["873"], "connection"=>["close"], "x-gnu"=>["Michael J Blanchard"], "access-control-allow-origin"=>["*"], "etag"=>["W/\"369-Q/javgZOho3M1JlZbqxE/gi5oyE\""]}>, @data={"status"=>200, "result"=>{"postcode"=>"SG4 7BH", "quality"=>1, "eastings"=>525799, "northings"=>229833, "country"=>"England", "nhs_ha"=>"East of England", "longitude"=>-0.17086, "latitude"=>51.952768, "european_electoral_region"=>"Eastern", "primary_care_trust"=>"Hertfordshire", "region"=>"East of England", "lsoa"=>"North Hertfordshire 005G", "msoa"=>"North Hertfordshire 005", "incode"=>"7BH", "outcode"=>"SG4", "parliamentary_constituency"=>"North East Hertfordshire", "admin_district"=>"North Hertfordshire", "parish"=>"Weston", "admin_county"=>"Hertfordshire", "admin_ward"=>"Weston and Sandon", "ced"=>"Royston West & Rural", "ccg"=>"NHS East and North Hertfordshire", "nuts"=>"Hertfordshire", "codes"=>{"admin_district"=>"E07000099", "admin_county"=>"E10000015", "admin_ward"=>"E05004784", "parish"=>"E04012229", "parliamentary_constituency"=>"E14000845", "ccg"=>"E38000049", "ccg_id"=>"06K", "ced"=>"E58000659", "nuts"=>"UKH23"}}}>, @whitelist=#<Whitelist:0x007fca6dba5bc8 @final_lsoa=nil>, @lsoa=nil>  
2.2.10 :003 > data = result.show_data
 => {"status"=>200, "result"=>{"postcode"=>"SG4 7BH", "quality"=>1, "eastings"=>525799, "northings"=>229833, "country"=>"England", "nhs_ha"=>"East of England", "longitude"=>-0.17086, "latitude"=>51.952768, "european_electoral_region"=>"Eastern", "primary_care_trust"=>"Hertfordshire", "region"=>"East of England", "lsoa"=>"North Hertfordshire 005G", "msoa"=>"North Hertfordshire 005", "incode"=>"7BH", "outcode"=>"SG4", "parliamentary_constituency"=>"North East Hertfordshire", "admin_district"=>"North Hertfordshire", "parish"=>"Weston", "admin_county"=>"Hertfordshire", "admin_ward"=>"Weston and Sandon", "ced"=>"Royston West & Rural", "ccg"=>"NHS East and North Hertfordshire", "nuts"=>"Hertfordshire", "codes"=>{"admin_district"=>"E07000099", "admin_county"=>"E10000015", "admin_ward"=>"E05004784", "parish"=>"E04012229", "parliamentary_constituency"=>"E14000845", "ccg"=>"E38000049", "ccg_id"=>"06K", "ced"=>"E58000659", "nuts"=>"UKH23"}}}
2.2.10 :004 > result.find_lsoa(data)
 => "North Hertfordshire 005G"
2.2.10 :005 > whitelist.final_lsoa
 => "North Hertfordshire 005G"
2.2.10 :006 > whitelist.check_lsoa
 => "This postcode is not servable"
2.2.10 :007 >
```

Invalid postcode:
```
2.2.10 :001 > require './models/postcode.rb'
 => true
2.2.10 :002 > result = Result.new(postcode = Postcode.new('none'), whitelist = Whitelist.new('Southwark', 'Lambeth'))
 => #<Result:0x007ffdd33377e0 @postcode=#<Postcode:0x007ffdd334c4d8 @my_postcode="none", @response=#<HTTParty::Response:0x7ffdd333c3a8 parsed_response={"status"=>404, "error"=>"Invalid postcode"}, @response=#<Net::HTTPNotFound 404 Not Found readbody=true>, @headers={"server"=>["nginx/1.14.0"], "date"=>["Wed, 26 Feb 2020 11:38:31 GMT"], "content-type"=>["application/json; charset=utf-8"], "content-length"=>["41"], "connection"=>["close"], "x-gnu"=>["Michael J Blanchard"], "access-control-allow-origin"=>["*"], "etag"=>["W/\"29-T14TWaKfjMuMFPoRgcsDj2g1ORs\""]}>, @data={"status"=>404, "error"=>"Invalid postcode"}>, @whitelist=#<Whitelist:0x007ffdd3337808 @final_lsoa=nil>, @lsoa=nil>
2.2.10 :003 > data = result.show_data
 => {"status"=>404, "error"=>"Invalid postcode"}
2.2.10 :004 > result.find_lsoa(data)
 => "Invalid postcode"
2.2.10 :005 > whitelist.final_lsoa
 => nil
2.2.10 :006 > whitelist.check_lsoa
 => "Invalid postcode"
2.2.10 :007 >
```
