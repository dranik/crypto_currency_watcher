class Hitbtc
  require 'uri'
  require 'net/http'

  def update_pairs
    url = URI('https://api.hitbtc.com/api/2/public/symbol')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    if response.code == '200'
      JSON.parse(response.read_body).each do |pair_data|
        pair_data['name'] = pair_data.delete('id')
        pair = {}
        pair_data.each do |key, value|
          pair[key.underscore] = value
        end
        if Pair.where(name: pair['name']).empty?
          Pair.create(pair)
        else
          Pair.find_by(name: pair['name']).update(pair)
        end
      end
    end
    nil
  end

  def do_tick
    url = URI("https://api.hitbtc.com/api/2/public/ticker")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    if response.code == '200'
      ticks = JSON.parse(response.read_body).map do |tick_data|
        record = {}
        record['pair_id'] = Pair.find_by(name: tick_data['symbol']).id
        tick_data.each do |key, value|
          record[key.underscore] = value
        end
        Tick.new record
      end
      Tick.import ticks
    end
  end
end
