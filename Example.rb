require 'IPQuery'

# Create an instance of the IPQuery class
ip_query = IPQuery.new

# Query an IP address
puts "Enter IP: "
result = ip_query.query(gets.chomp)

if result
  puts "IP Address: #{result.ip}"
  puts "ISP: #{result.isp}"
  puts "Location: #{result.location}"
  puts "Is Mobile: #{result.is_mobile}"
  puts "Is VPN: #{result.is_vpm}"
  puts "Is Tor: #{result.is_tor}"
  puts "Is Proxy: #{result.is_proxy}"
  puts "Is Datacenter: #{result.is_datacenter}"
  puts "Risk Score: #{result.risk_score}"
else
  puts "Failed to query the IP address."
end
