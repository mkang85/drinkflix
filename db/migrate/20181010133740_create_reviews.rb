class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belong_to :user
      t.belong_to :film
      t.string :content
      t.timestamps
    end
  end
end
