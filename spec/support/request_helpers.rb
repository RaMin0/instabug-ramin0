module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true) 
    end
  end

  module HeadersHelpers
    def include_default_accept_headers(version = 1)
      request.headers['Accept'] = "#{Mime::JSON},application/vnd.instabug-ramin0+json;version=#{version}"
    end
  end
end
