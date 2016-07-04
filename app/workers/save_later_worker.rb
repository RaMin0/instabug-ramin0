class SaveLaterWorker
  include Sidekiq::Worker

  def perform(class_name, attributes)
    klass = class_name.constantize
    record = klass.new(attributes)
    record.save!
  end
end
