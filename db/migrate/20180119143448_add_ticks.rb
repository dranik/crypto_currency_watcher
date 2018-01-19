class AddTicks < ActiveRecord::Migration[5.1]
  def change
    create_table :ticks do |t|
      t.references  :pair
      t.decimal     :mid
      t.decimal     :bid
      t.decimal     :ask
      t.decimal     :last_price
      t.decimal     :low
      t.decimal     :high
      t.decimal     :volume
      t.datetime    :timestamp
    end
  end
end
