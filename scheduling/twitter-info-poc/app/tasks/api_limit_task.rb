class ApiLimitTask
  class << self
    def perform(*params)
      ActiveRecord::Base.verify_active_connections!

      if reset_time = api_exhausted(@api_name)
        Resque.enqueue_at(reset_time, self, *params)
        return
      end

      # Don't run taks if any children tasks scheduled or running
      if any_children_running?
        puts "Found running children. Finishing..."
        return
      end

      perform_task(*params)
    rescue Twitter::Error::TooManyRequests => e
      # Reschedule task after limit time
      puts "Rescheduling job due too manu requests"
      api = ApiTimeout.where(api: api).first_or_initialize
      api.reset_time = e.rate_limit.reset_at
      api.save
      Resque.enqueue_at(e.rate_limit.reset_at, self.class, *params)
    end

    protected

    # Returns true if API exhausted
    def api_exhausted(api)
      time = ApiTimeout.where(api: api).first.try(:reset_time)
      time && time > Time.now ? time : nil
    end

    # Checks if any children queue exists
    def any_children_running?
      (@children_queues || []).each do |q|
        return true if Resque.size(q) > 0 || Resque.working.any?{|w| w.job[:queue].to_s == q.to_s}
      end
      false
    end
  end
end
