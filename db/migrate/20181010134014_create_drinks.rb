class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.belongs_to :user
      t.belongs_to :film
      t.string :type
      t.integer :amount
      t.timestamps
    end
  end
end
