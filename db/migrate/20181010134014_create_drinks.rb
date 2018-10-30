class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :type
      t.integer :amount
      t.timestamps
    end
  end
end
