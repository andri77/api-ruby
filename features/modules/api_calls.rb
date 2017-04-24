require 'typhoeus'

module ApiCalls
  @base_url = $price_finder_url

  def self.post_barcode(body)
    @result = Typhoeus::Request.new(
                  @base_url + '/pricefinder',
                  method: :post,
                  body: body,
                  headers: $pf_headers ).run
    puts "url #{@base_url}}"
    puts "headers #{$pf_headers}"
    json = JSON.parse(@result.body)
  end

  def self.get_stores()
    @result = Typhoeus::Request.new(
                            @base_url + '/myerstore',
                            headers: $pf_headers ).run
    json = JSON.parse(@result.body)
  end

  def self.get_barcode(locationId, barcode)
    @result = Typhoeus::Request.new(
                  @base_url  + '/pricefinder',
                  params: {:locationId => locationId, :barcode => barcode},
                  headers: $pf_headers ).run
    puts "url #{@base_url}}"
    puts "headers #{$pf_headers}"
    json = JSON.parse(@result.body)
  end


end
