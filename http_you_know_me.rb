require 'socket'
require './request_parser'

tcp_server = TCPServer.new(9292)



# class YouKnowMeServer

  count = 0

  loop do

    client = tcp_server.accept
    puts "Ready for Request:"

    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end

    rp = RequestParser.new(request_lines)
    rp.isolate_verb
    rp.isolate_path
    rp.isolate_protocol
    rp.isolate_host
    rp.isolate_port
    rp.isolate_origin
    rp.isolate_accept
    final_parse = rp.parsed_request

    puts "Sending Response..."

    response = "<pre>" + "Hello_World (#{count})\nResend request to up counter\n" + final_parse + "<pre>"
    output = "<html><head></head><body>#{response}</body></html>"

    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")

    count += 1

    client.puts headers
    client.puts output

  end

  client.close
# end
