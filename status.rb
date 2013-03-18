#!/usr/local/bin/ruby

require 'net/http'

begin 
  while TRUE
    url = URI.parse(ARGV[0])
    req = Net::HTTP.new(url.host)
    req.start() do |req|
      x = req.head(url.path)
      if x.code == "200" or x.code == "204"
        puts "up"
      else
        puts "down"
      end
    end
    sleep(60)
  end
rescue Exception => e
  puts "Invalid URL Specified"
  puts "Exception Message: " + e.message
end

