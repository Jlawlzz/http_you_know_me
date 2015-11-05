require './client_response'

class DefaultFunctions

  def initialize
    @dict = File.read("/usr/share/dict/words").split
  end

  def default_path
  end

  def hello_path(counter)
    "Hello_World (#{counter - 1})"
  end

  def datetime_path
    time = Time.new
    time.strftime("%I:%M %p on %A, %B %d, %Y")
  end

  def shutdown_path(counter)
    "Total Requests: #{counter}\n
    Server is now shutdown."
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
