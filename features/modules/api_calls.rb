require 'httparty'

module ApiCalls
  include HTTParty
  base_uri $price_finder_url

  def self.post_barcode(body)
    @result = HTTParty.post(base_uri + '/pricefinder',
                  :body => body,
                  :headers => $pf_headers )
    puts "url #{base_uri}}"
    puts "headers #{$pf_headers}"
    json = JSON.parse(@result.body)
  end

  def self.get_stores()
    @result = HTTParty.get(base_uri + '/myerstore',
                            :headers => $pf_headers )
    json = JSON.parse(@result.body)
  end

  def self.get_barcode(locationId, barcode)
    @result = HTTParty.get(base_uri  + '/pricefinder',
                  :query => {:locationId => locationId, :barcode => barcode},
                  :headers => $pf_headers )
    puts "url #{base_uri}}"
    puts "headers #{$pf_headers}"
    json = JSON.parse(@result.body)
  end


end