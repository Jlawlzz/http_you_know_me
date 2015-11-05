class ResponseFormatter

  def initialize(request_response)
    @request_response = request_response
    if @request_response.include?("Re-Direct")
      re_direct_response
    else
      response
    end
  end

  def re_direct_response
    response = "<pre>" + @request_response + "<pre>"
    output = "<html><head></head><body>#{response}</body></html>"

    headers = ["http/1.1 302 found",
              "location: http://127.0.0.1:9292/game",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    response_send = [response, output, headers]
  end

  def response
    response = "<pre>" + @request_response + "<pre>"
    output = "<html><head></head><body>#{response}</body></html>"

    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    response_send = [response, output, headers]
  end
end
