class App < ActiveRecord::Base
  # Concerns
  include HasUniqueUuid
  include ConsistentCounterCache
  
  # Plugins
  devise
  acts_as_token_authenticatable
  consistent_counter_cache :bugs_count
  consistent_counter_cache :next_bug_number
  
  # Validations
  validates :name, presence: true
  
  # Relations
  has_many :bugs, dependent: :destroy
  
  # Methods
  def calculate_next_bug_number
    self.bugs.maximum(:number) + 1
  end
end
