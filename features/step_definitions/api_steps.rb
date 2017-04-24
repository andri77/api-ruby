require 'json'
require 'typhoeus'

Given(/^I logged in as "([^"]*)" through API call$/) do |user|
  username = ENV_DATA[user][:number]
  password = ENV_DATA[user][:password]
  # @env = MY_ENV.current_env
  # @api_url = "https://myerone-app-auth-api-#{@env}.myer-services.com.au/auth"
  body = {
      "username"=>"627804""#{username}",
      "password"=>"#{password}",
      "deviceId"=>"22222",
      "platform"=>"iOS"
  }.to_json
  auth_url =  $auth_url + '/auth'
  puts "Request post body " + body
  @result = Typhoeus::Request.new(
                          auth_url,
                          method: :post,
                          body: body,
                          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'} ).run
  json = JSON.parse(@result.body)
  puts json
  @token = json["token"]
  puts "I'm the token " + @token


  # @propertyid = json['pushThis'][0]['propertyid'].to_s
  # @agentid = json['pushThis'][0]['agentid'].to_s
  # @portalid = json['pushThis'][0]['portalid'].to_s
  # puts @propertyid + " " + @agentid + " " + @portalid
end

Given(/^I will get the following response:$/) do |table|
  data = table.rows_hash
  data.each do |row|
    @json[row[0]].to_s.should == row[1].to_s
  end
end

Given(/^As Myer One App user, I want to make a request to get all Myer Stores$/) do
  @json = ApiCalls.get_stores
  puts @json
end

And(/^I will get the following details of store position "([^"]*)":$/) do |position, table|
  data = table.rows_hash
  data.each do |row|
    @json['locations'][position.to_i][row[0]].to_s.should include(row[1].to_s)
  end
end

And(/^prices and shopping credits are returned as expected$/) do
  sellPrice = @json['sellPrice']
  retailPrice = @json['retailPrice']
  credits = @json['shoppingCredits']
  (retailPrice > 0).should == true
  (sellPrice > 0).should == true
  credits.should ==  (sellPrice * 2)
end

Given(/^As Myer One App user, I want to make a request for price finder based on (.*) and (.*)$/) do |locationId, barcode|
  @json = ApiCalls.get_barcode(locationId, barcode)
  puts @json
end