# Description of the program



# Instructions for running

```
$ git clone https://github.com/amybalmforth/postcodes.git
$ bundle install
$ rspec
$ rubocop
```

# Demonstration of how the code works in IRB

```
2.2.10 :001 > require './models/postcode.rb'
 => true
2.2.10 :002 > result = Result.new(postcode = Postcode.new('SG47BH'), whitelist = Whitelist.new)
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
