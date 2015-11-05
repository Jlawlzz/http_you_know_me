require 'socket'
require './client_response'

tcp_server = TCPServer.new(9292)
client_response = ClientResponse.new

  loop do

    client = tcp_server.accept

    client_response.wait_for_response(client)
    puts client_response.request_lines
    client_response.get_parsed_request
    request_response = client_response.route

    puts "Sending Response..."

    if request_response.include?("Re-Direct")

      output = "<html><head></head><body></body></html>"
      headers = ["http/1.1 302 found",
                "Location: http://127.0.0.1:9292/game",
                "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
                "server: ruby",
                "content-type: text/html; charset=iso-8859-1",
                "content-length: #{output.length}\r\n\r\n"].join("\r\n")

      client.puts headers
      client.puts output

      client_response.wait_for_response(client)
      client_response.re_format_request_lines
      puts client_response.request_lines
      client_response.get_parsed_request
      request_response = client_response.route
    end

    puts "yay"

    response = "<pre>" + request_response + "<pre>"
    output = "<html><head></head><body>#{response}</body></html>"

    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")

    client.puts headers
    client.puts output

    if request_response.include?("shutdown")
      break
    end

  end

    # response_array = response_formatter(request_response)
    # response = response_array[0]
    # output = response_array[1]
    # headers = response_array[2]
    #

    # client.puts headers
    # client.puts output
  # end

  client.close
# # end
