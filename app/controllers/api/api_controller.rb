class Api::ApiController < ApplicationController
  include FullRequestAndResponseLogger
  
  acts_as_token_authentication_handler_for App, fallback: :exception

  respond_to :json
  before_action :verify_request_format!
  self.responder = FullMessagesResponder

  rescue_from Exception do |e|
    Rails.logger.error "#{e.class}: #{e}"
    e.backtrace.take(15).each { |b| Rails.logger.error "  #{b}" }

    case e
    when Unauthorized
      head :forbidden
    when ActiveRecord::RecordNotFound, ActionController::RoutingError
      head :not_found
    else
      render status: :bad_request, json: { error: e.message }
    end
  end
  
  def four_oh_four
    raise ActionController::RoutingError.new(:not_found)
  end
end
