require 'sidekiq-scheduler'
class TicksWorker
  include Sidekiq::Worker

  def perform(*args)
    Hitbtc.new.do_tick
  end
end
