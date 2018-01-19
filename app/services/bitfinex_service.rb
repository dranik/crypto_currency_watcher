class BitfinexService
  require 'uri'
  require 'net/http'

  def update_pairs
    url = URI("https://api.bitfinex.com/v1/symbols_details")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    puts response.read_bod
  end

  def tick
    Pair.find_each do |pair|
      url = URI("https://api.bitfinex.com/v1/pubticker/#{pair.name}")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      puts response.read_body
    end
  end
end
