class FullMessagesResponder < ActionController::Responder
  def resource_errors
    { error: resource.errors.full_messages.to_sentence }
  end
  
  def to_format
    if get? && !resource
      controller.response.status = :not_found
    elsif post?
      controller.response.status = :created
    end
    super
  end
end
