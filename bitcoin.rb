require 'net/http'
require 'json'
require 'date'
require 'csv'

API = 'https://api.coindesk.com/v1/bpi/currentprice.json'.freeze
CSV_FILENAME = 'bitcoin_prices.csv'.freeze

def get_bitcoin_price(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    current_price = JSON.parse(response)

    rate = current_price['bpi']['USD']['rate_float']
    time = Date.parse(current_price['time']['updated']).strftime('%y-%m-%d')

    { rate: rate, time: time }
end

def append_to_csv(filename, rate, time)
    CSV.open(filename, 'a') do |file|
        file << [rate, time]
    end
end

bitcoin_price = get_bitcoin_price(API)
append_to_csv(CSV_FILENAME, bitcoin_price[:rate], bitcoin_price[:time])
