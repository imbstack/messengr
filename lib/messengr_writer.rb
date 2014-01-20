require 'httparty'

print "Welcome to Messengr, what's your username: "
@user = gets.chomp

def send_message(message)
  response = HTTParty.post("http://messengr.herokuapp.com/messages", { :query => { :color => "green" } })

  puts response.parsed_response.inspect

  puts "ERROR: #{response.parsed_response['errors']}" if response.parsed_response["errors"]
end

begin
  print "Say something: "
  message = gets.chomp
  break if message == "quit"
  response = send_message(message)
end while true
