class ReactPath

  attr_reader :request_count

  def initialize
    @request_count = 0
  end

  def route_function(path)
    if path == '/'
      default_path
    elsif path == '/hello'
      hello_path
    elsif path == '/datetime'
      datetime_path
    elsif path == '/shutdown'
      shutdown_path
    elsif path[0..11] == '/word_search'
      word_search(path)
    else
      default_path
    end
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

  def word_search(path)
   @request_count += 1
  #  word = path.split('?')[1]
    path.slice!("/word_search?word=")
    path
  end

end
