require './router'
require './request_parser'
require './default_functions'
require './game'

class ClientResponse

  include Router

  attr_reader :request_lines, :default_functions, :game

  def initialize
    puts "Ready for Request:"
    @default_functions = DefaultFunctions.new
    @game = Game.new
    @request_count = 0
  end

  def wait_for_response(client)
    @request_count += 1
    @request_lines = []
    while line = client.gets and !line.chomp.empty?
     request_lines << line.chomp
    end
    if request_lines.join.include?("Content-Type")
      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end
      request_lines << client.gets
    end
  end

  def re_format_request_lines
    @request_lines.shift
  end

  def get_parsed_request
    @request_parser = RequestParser.new(request_lines)
  end

  def route
    response = route_verb(@request_parser.request_array,@request_count)
    "#{response}\n\n#{@request_parser.execute}"
  end

end
#
