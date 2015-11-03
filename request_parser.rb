
class RequestParser

  attr_reader :request_lines

  def initialize(request_lines)
    @request_lines = request_lines
    @request_array = []
  end

  def isolate_verb
    verb = @request_lines[0].split(' ')[0]
    @request_array << verb
    verb
  end

  def isolate_path
    path = @request_lines[0].split(' ')[1]
    @request_array << path
    path
  end

  def isolate_protocol
    protocol = @request_lines[0].split(' ')[2]
    @request_array << protocol
    protocol
  end

  def isolate_host
    host = @request_lines[1].split(':')[1]
    @request_array << host
    host
  end

  def isolate_port
    port = @request_lines[1].split(':')[2]
    @request_array << port
    port
  end

  def isolate_origin
    origin = "127.0.0.1"
    @request_array << origin
    origin
  end

  def isolate_accept
    accept = @request_lines[4].split(':')[1]
    @request_array << accept
    accept
  end

  def parsed_request
    "<pre>\nVerb: #{@request_array[0]}\nPath: #{@request_array[1]}\nProtocol: #{@request_array[2]}\nHost:#{@request_array[3]}\nPort: #{@request_array[4]}\nOrigin: #{@request_array[5]}\nAccept:#{@request_array[6]}\n<pre>"
  end

end
