module ConsistentCounterCache
  extend ActiveSupport::Concern
  
  module ClassMethods
    def consistent_counter_cache(column)
      # override the attribute access to allow cached/non-cached returns
      define_method(column) do |cached: true|
        self[column].to_i + unless cached
          counting_data_store = Counter::Cache.configuration.counting_data_store
          options = { relation_class_name: self.class.name, relation_id: self.id, column: column }.to_struct
          key = Counter::Cache::Counters::BufferCounter::Key.new(nil, options).to_s
          
          # return the increments/decrements from the cache to be added to the database value
          counting_data_store.get(key)
        end.to_i
      end
    end
  end
end
