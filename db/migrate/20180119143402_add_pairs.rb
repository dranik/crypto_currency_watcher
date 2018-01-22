class AddPairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.string    :name
      t.string    :base_currency
      t.string    :quote_currency
      t.decimal   :quantity_increment
      t.decimal   :tick_size
      t.decimal   :take_liquidity_rate
      t.decimal   :provide_liquidity_rate
      t.string    :fee_currency
    end
    add_index :pairs, :name, unique: true
  end
end
