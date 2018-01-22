require 'sidekiq-scheduler'
class PairsWorker
  include Sidekiq::Worker

  def perform(*args)
    Hitbtc.new.update_pairs
  end
end
