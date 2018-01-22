require 'sidekiq-scheduler'
class DayRatesWorker
  include Sidekiq::Worker

  def perform(*args)
    start = (Time.now.utc.to_date - 1).to_time(:utc)
    finish = Time.now.utc.to_date.to_time(:utc)
    Pair.find_each do |pair|
      ticks = Tick.where(timestamp: start..finish, pair: pair)
      DayRate.create(
                     pair: pair,
                     high: Tick.where(timestamp: start..finish, pair: pair).maximum(:high),
                     low:  Tick.where(timestamp: start..finish, pair: Pair.first).minimum(:low),
                     timestamp: Time.now.utc.to_date - 1
      )
    end
  end
end
