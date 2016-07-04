module Counter::Cache
  def self.included(base)
    base.instance_eval do
      def counter_cache_on(options)
        after_create ActiveRecordUpdater.new(options) unless options.delete(:skip_after_create)
        after_destroy ActiveRecordUpdater.new(options) unless options.delete(:skip_after_destroy)
      end
    end
  end
end

class Counter::Cache::Counters::BufferCounter::Key
  def to_s
    "cc:#{relation_finder.relation_class.underscore}:#{relation_finder.relation_id}:#{column}"
  end
end

Counter::Cache.configure do |config|
  config.default_worker_adapter = CounterCacheWorker
  config.recalculation_delay    = 15.seconds # 6.hours
  config.redis_pool             = Redis::Namespace.new(:"instabug-ramin0-#{Rails.env}", redis: Redis.new)
end
