module Request
  module JsonHelpers
    # refactor out json_response so we dont have to write this in our tests all the time
    # We scope the method into some modules just to keep our code nice and organised
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  # Our headers helpers module
  module HeadersHelpers
    def api_header(version = 1)
      request.headers['Accept'] = "application/vnd.marketplace.v#{version}"
    end

    def api_response_format(format = Mime::JSON)
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end

end
