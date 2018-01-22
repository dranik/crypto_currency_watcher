class AddDays < ActiveRecord::Migration[5.1]
  def change
    create_table :day_rates do |t|
      t.references  :pair
      t.decimal     :low
      t.decimal     :high
      t.datetime    :timestamp
    end
  end
end
