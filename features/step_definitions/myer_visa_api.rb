require 'json'
require 'typhoeus'

Given(/^As Myer One App user, I want to register for temporary account$/) do

  # @env = MY_ENV.current_env
  body = {
      "applicationReferenceNumber": "OAMY0000001234",
      "customers": [{
                        "customerRole":"PH",
                        "membershipNumber": "6278042121788917",
                        "staffNumber":"12345678",
                        "title":"Ms",
                        "firstName":"Megan",
                        "lastName":"Sample",
                        "dateOfBirth":"2017-01-23",
                        "mobilePhone":"0412345678",
                        "email":"mel334243e@yopmail.com",
                        "address": {
                            "street":"5/1 Shelley St",
                            "postcode":"2000",
                            "suburb":"Sydney",
                            "state":"NSW",
                            "country":"AU"
                        }
                    }],
      "applicationURLType":"P"
  }.to_json
  myer_visa_active =  $myer_visa_url + '/v1/active'
  puts "Request post body " + body
  @result = Typhoeus::Request.new(
      myer_visa_active,
      method: :post,
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'},
      body: body
  ).run
  json = JSON.parse(@result.body)
  puts "Response body " + json.to_s

end