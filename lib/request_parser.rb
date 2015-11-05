

class RequestParser

  attr_reader :request_lines, :request_array

  def initialize(request_lines)
    @request_lines = request_lines
    @request_array = []
    execute
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

  def isolate_guess
    if @request_array[0] == "POST" && @request_array[1] == "/game"
      guess = @request_lines[-1].split("\"")[0]
      @request_array << guess.chomp
    end
  end

  def parsed_request
    "<pre>\nVerb: #{@request_array[0]}\nPath: #{@request_array[1]}\nProtocol: #{@request_array[2]}\nHost:#{@request_array[3]}\nPort: #{@request_array[4]}\nOrigin: #{@request_array[5]}\nAccept:#{@request_array[6]}\n<pre>"
  end

  def execute
    #temporary
    isolate_verb
    isolate_path
    isolate_protocol
    isolate_host
    isolate_port
    isolate_origin
    isolate_accept
    isolate_guess
    parsed_request
  end

end
