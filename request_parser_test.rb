require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './request_parser'

class RequestParserTest < Minitest::Test

  def initialize
    @request = ["GET / HTTP/1.1", "Host: 127.0.0.1:9292", "Connection: keep-alive", "Cache-Control: max-age=0", "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8", "Upgrade-Insecure-Requests: 1", "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36", "Accept-Encoding: gzip, deflate, sdch", "Accept-Language: en-US,en;q=0.8"]

  def test_it_takes_request_lines_as_array
    rp = RequestParser.new(["lines", "other_lines"])
    assert_equal ["lines", "other_lines"], rp.request_lines
  end

  def test_parser_formats_request
    rp = RequestParser.new(@request)
    assert_equal "<pre>\nVerb: GET\nPath: /\nProtocol: HTTP/1.1\nHost: 127.0.0.1\nPort: 9292\nOrigin: 127.0.0.1\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\n<pre>", rp.parsed_request
  end



end
