module FullRequestAndResponseLogger
  extend ActiveSupport::Concern
  
  included do
    append_around_action :log_request_and_response
    
    def log_request_and_response
      logged_headers      = %w[accept authorization accept_language content_type user_agent x_app_uuid x_app_token]
      logged_headers_size = logged_headers.max_by(&:size).size
      
      Rails.logger.info { '  Headers:' }
      logged_headers.each do |header|
        header       = header.titleize.gsub(/\s/, '-')
        header_value = request.headers[header]
        Rails.logger.info { "    #{header.rjust(logged_headers_size)} => #{header_value.inspect}" } if header_value.present?
      end
      
      begin
        json = JSON.pretty_generate(JSON.parse(request.body.read))
        Rails.logger.debug { '  Body:' }
        json.lines.each { |l| Rails.logger.debug { "    #{l.chomp}" } }
      rescue Exception => e
      end
      
      yield
      
      begin
        json = JSON.pretty_generate(JSON.parse(response.body))
        Rails.logger.debug { '  Body:' }
        json.lines.each { |l| Rails.logger.debug { "    #{l.chomp}" } }
      rescue Exception => e
      end
    end
    private :log_request_and_response
  end
end
