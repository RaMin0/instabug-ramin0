class FullMessagesResponder < ActionController::Responder
  def resource_errors
    errors = resource.errors
    error_messages = errors.to_hash.inject({}) { |_, (k, v)| _.merge k => v.to_sentence }
    error_messages_sentence = errors.full_messages.to_sentence
    
    {
      errors: errors,
      error_messages: error_messages,
      error_messages_sentence: error_messages_sentence
    }
  end
end
