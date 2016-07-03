class Bug < ActiveRecord::Base
  # Concerns
  include Counter::Cache
  
  # Plugins
  enum status: %w[open in_progress closed]
  enum priority: %w[minor major critical]
  counter_cache_on column: :bugs_count,
                   relation: :app,
                   relation_class_name: 'App',
                   touch_column: :bugs_count_updated_at,
                   wait: 10.seconds
  counter_cache_on column: :next_bug_number,
                   relation: :app,
                   relation_class_name: 'App',
                   method: :calculate_next_bug_number,
                   wait: 10.seconds,
                   if: :persisted?.to_proc
  
  # Callbacks
  before_create -> { self.number = self.app.next_bug_number(cached: false) }
  
  # Relations
  belongs_to :app
end
