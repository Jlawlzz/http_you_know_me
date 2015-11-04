class ReactPath

  attr_reader :request_count

  def initialize
    @request_count = 0
  end

  def route_function(path)
    case path
    when '/'
      default_path
    when '/hello'
      hello_path
    when '/datetime'
      datetime_path
    when '/shutdown'
      shutdown_path
    end
    path
  end

  def default_path
    @request_count +=1
  end

  def hello_path
    @request_count += 1
    "Hello_World (#{request_count - 1})"
  end

  def datetime_path
    @request_count +=1
    time = Time.new
    time.strftime("%I:%M %p on %A, %B %d, %Y")
  end

  def shutdown_path
    @request_count +=1
    "Total Requests: #{@request_count}"
  end

end
