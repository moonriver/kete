class FeedsWorker < BackgrounDRb::MetaWorker
  set_worker_name :feeds_worker
  set_no_auto_load true

  def create(feed_id = nil)
    raise "Trying to start worker with :data nil or less than 1 (needs Feed id > 0)" if feed_id.nil? || feed_id.to_i < 1

    feed = Feed.find_by_id(feed_id)
    raise "Feed of id #{feed_id} not found! Please supply valid feed id." unless feed

    # update_frequency is stored in minutes
    frequency_in_seconds = (feed.update_frequency * 60).to_i
    add_periodic_timer(frequency_in_seconds) { update(feed_id) }
  end

  def update(feed_id)
    logger.info("what is time: " + Time.now.to_s)
    feed = Feed.find_by_id(feed_id)
    feed.update_feed if feed
  end

end
