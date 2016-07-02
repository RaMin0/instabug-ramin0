module HasUniqueUuid
  extend ActiveSupport::Concern

  included do
    private :generate_uuid
    
    before_save :ensure_uuid
  end

  def ensure_uuid
    if uuid.blank?
      self.uuid = generate_uuid
    end
  end

  def generate_uuid
    loop do
      uuid = SecureRandom.uuid
      break uuid if self.class.where(uuid: uuid).count == 0
    end
  end
end
