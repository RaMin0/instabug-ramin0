class App < ActiveRecord::Base
  # Concerns
  include HasUniqueUuid
  
  # Plugins
  devise
  acts_as_token_authenticatable
  
  # Validations
  validates :name, presence: true
end
