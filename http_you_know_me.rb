require 'socket'
require './client_response'

tcp_server = TCPServer.new(9292)
client_response = ClientResponse.new

  loop do

    client = tcp_server.accept

    client_response.wait_for_response(client)
    client_response.get_parsed_request
    request_response = client_response.react_to_path

    puts "Sending Response..."

    response = "<pre>" + request_response + "<pre>"
    output = "<html><head></head><body>#{response}</body></html>"

    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")

    client.puts headers
    client.puts output

  end

  client.close
# end
