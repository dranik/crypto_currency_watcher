class AddTicks < ActiveRecord::Migration[5.1]
  def change
    create_table :ticks do |t|
      t.references  :pair
      t.decimal     :ask
      t.decimal     :bid
      t.decimal     :last
      t.decimal     :open
      t.decimal     :low
      t.decimal     :high
      t.decimal     :volume
      t.decimal     :volume_quote
      t.datetime    :timestamp
      t.string      :symbol
    end
  end
end
