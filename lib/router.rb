require '../lib/client_response'

module Router

  def route_verb(request_array, counter)
    if request_array[0] == "GET"
      route_get(request_array, counter)
    else
      route_post(request_array, counter)
    end
  end

  def route_get(request_array, counter)

    if request_array[1] == '/hello'
      default_functions.hello_path(counter)
    elsif request_array[1] == '/datetime'
      default_functions.datetime_path
    elsif request_array[1] == '/shutdown'
      default_functions.shutdown_path(counter)
    elsif request_array[1][0..11] == '/word_search'
      default_functions.word_search(request_array)
    elsif request_array[1] == "/game"
      game.guess_eval
    else
      default_functions.default_path
    end
  end

  def route_post(request_array, counter)
    if request_array[1] == '/start_game'
      game.start_game
    elsif request_array[1] == '/game'
      game.guess_storage(request_array[-1])
    end
  end
end
