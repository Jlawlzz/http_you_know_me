require './client_response'

class DefaultFunctions

  def initialize
    @dict = File.read("/usr/share/dict/words").split
    @counter = 0
  end

  def default_path
  end

  def hello_path
    "Hello_World (#{@counter})"
  end

  def datetime_path
    time = Time.new
    time.strftime("%I:%M %p on %A, %B %d, %Y")
  end

  def shutdown_path
    "Total Requests: #{@counter}"
  end

  def word_search(request_array)
  #  word = path.split('?')[1]
    request_array[1].slice!("/word_search?word=")
    if @dict.include?(request_array[1])
      "#{request_array[1]} is a word!"
    else
      "Go fuck yourself!"
    end
  end

end
