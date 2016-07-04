class Bug < ActiveRecord::Base
  # Concerns
  include Counter::Cache
  
  # Constants
  STATUSES = %w[new in_progress closed].freeze
  PRIORITIES = %w[minor major critical].freeze
  COUNTER_CACHE_BUGS_COUNT_OPTIONS = { column: :bugs_count,
                                       relation: :app,
                                       relation_class_name: 'App',
                                       touch_column: :bugs_count_updated_at,
                                       wait: 10.seconds }
  COUNTER_CACHE_NEXT_BUG_NUMBER_OPTIONS = { column: :next_bug_number,
                                            relation: :app,
                                            relation_class_name: 'App',
                                            method: :calculate_next_bug_number,
                                            wait: 10.seconds }
  
  # Plugins
  counter_cache_on COUNTER_CACHE_BUGS_COUNT_OPTIONS.merge \
                    skip_after_create: true
  counter_cache_on COUNTER_CACHE_NEXT_BUG_NUMBER_OPTIONS.merge \
                   skip_after_create: true,
                   skip_after_destroy: true
  
  # Validations
  validates :status, inclusion: { in: STATUSES }
  validates :priority, inclusion: { in: PRIORITIES }
  
  # Relations
  belongs_to :app
  has_one :state, dependent: :destroy
  accepts_nested_attributes_for :state, reject_if: :all_blank
  
  # Methods
  def save_later
    self.number = self.app.next_bug_number(cached: false)
    
    ActiveRecordUpdater.new(COUNTER_CACHE_BUGS_COUNT_OPTIONS).after_create(self)
    ActiveRecordUpdater.new(COUNTER_CACHE_NEXT_BUG_NUMBER_OPTIONS).after_create(self)
    
    SaveLaterWorker.perform_async('Bug', save_later_attributes)
  end
  
  def save_later_attributes
    {
      app_id:   self.app_id,
      number:   self.number,
      status:   self.status,
      priority: self.priority,
      state_attributes: {
        device:  self.state.device,
        os:      self.state.os,
        memory:  self.state.memory,
        storage: self.state.storage
      }
    }
  end
end
