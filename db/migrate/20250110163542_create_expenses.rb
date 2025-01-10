class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :item_name
      t.integer :cost
      t.date :logged_date

      t.timestamps
    end
  end
end
