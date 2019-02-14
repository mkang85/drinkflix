class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :film
      t.belongs_to :drink
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
