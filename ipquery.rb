require 'net/http'
require 'uri'
require 'json'

BASE_URL = 'https://api.ipquery.io/'

class IPQueryResult
    def initialize(response)
        @ip=response['ip']
        @isp=response['isp']
        @location=response['location']
        @is_mobile=response['risk']['is_mobile']
        @is_vpm=response['risk']['is_vpn']
        @is_tor=response['risk']['is_tor']
        @is_proxy=response['risk']['is_proxy']
        @is_datacenter=response['risk']['is_datacenter']
        @risk_score=response['risk']['risk_score']
    end
end

class IPQuery
  def initialize
    
  end

  def query(ip)
    uri = URI("#{BASE_URL}#{ip}")

    Net::HTTP.get(uri)
    response = Net::HTTP.get_response(uri)

    IPQueryResult.new(JSON.parse(response.body)) if response.is_a?(Net::HTTPSuccess)
  rescue StandardError => e
    puts "Error: #{e.message}"
    nil
  end
end
