require 'socket'

tcp_server = TCPServer.new(9292)


class YouKnowMeServer

  count = 0

  loop do

    client = tcp_server.accept
    puts "Ready for Request:"

    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end

    puts "Sending Response..."

    response = "<pre>" + "Hello_World (#{count})\nResend request to up counter\n" + request_lines.to_s + "<pre>"
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

end
