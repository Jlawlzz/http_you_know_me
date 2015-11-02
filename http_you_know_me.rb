require 'socket'

tcp_server = TCPServer.new(9292)

count = 0

loop do

  client = tcp_server.accept

  puts "Sending Response..."

  response = "<pre>" + "Hello_World (#{count})\n Resend request to up counter" + "<pre>"
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
