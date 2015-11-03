require './react_path'
require './request_parser'

class ClientResponse

  attr_reader :request_lines, :react_path_obj, :parsed_request

  def initialize
    puts "Ready for Request:"
    @react_path_obj = ReactPath.new
  end

  def wait_for_response(client)
    @request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
  end

  def get_parsed_request
    @parsed_request = RequestParser.new(request_lines)
  end

  def react_to_path
    response = @react_path_obj.route_function(@parsed_request.isolate_path)
    "#{response}\n\n#{@parsed_request.execute}"
  end
end
