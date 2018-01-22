class Pair < ApplicationRecord
  has_many :ticks
  has_many :day_rates
end
