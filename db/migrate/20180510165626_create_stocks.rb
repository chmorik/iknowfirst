class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.date :date
      t.string :symbol, limit: 5
      t.float :signal3
      t.float :pred3
      t.float :signal7
      t.float :pred7
      t.float :signal14
      t.float :pred14
      t.float :signal31
      t.float :pred31
      t.float :signal92
      t.float :pred92
      t.float :signal365
      t.float :pred365
      t.timestamps
    end
  end
end
