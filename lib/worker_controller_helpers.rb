# used by controllers that manage backgroundrb workers
module WorkerControllerHelpers
  unless included_modules.include? WorkerControllerHelpers
    def backgroundrb_is_running?(worker_type, worker_key = nil)
      worker_key = worker_key || worker_type
      is_running = false
      MiddleMan.all_worker_info.each do |server|
        if !server[1].nil?
          server[1].each { |workers| is_running = true if (worker_type.to_sym == workers[:worker] &&
                                                           (workers[:worker_key].blank? ||
                                                            worker_key.to_s == workers[:worker_key])) }
        end
        break if is_running
      end
      is_running
    end

    def delete_existing_workers_for(worker_type, worker_key = nil)
      worker_key = worker_key || worker_type
      if backgroundrb_is_running?(worker_type, worker_key)
        MiddleMan.worker(worker_type.to_sym, worker_key.to_s).delete
        sleep 5 # give it time to kill the worker
      end
    end
  end
end
