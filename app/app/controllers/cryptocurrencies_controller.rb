require 'net/https'
require 'uri'
require 'json'

class CryptocurrenciesController < ApplicationController

  before_action :redirect_unless_logged_in

  def index
    uri = URI.parse('https://api.coinmarketcap.com/v2/ticker/?limit=10&sort=market_cap')
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Get.new(uri.request_uri)

    res = http.request(req)
    json = JSON.parse(res.body)
    @cryptocurrencies = json['data']
  rescue
    @cryptocurrencies = {}    
  end

  private

  def redirect_unless_logged_in
    redirect_to root_path unless logged_in?
  end
end
