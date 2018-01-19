class AddPairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.string    :name
      t.integer   :price_precision
      t.decimal   :initial_margin
      t.decimal   :minimum_margin
      t.decimal   :maximum_order_size
      t.decimal   :minimum_order_size
      t.datetime  :expiration
    end
    add_index :pairs, :pair, unique: true
  end
end
