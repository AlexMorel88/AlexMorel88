class CreateUserReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reviews do |t|
      t.integer :rating
      t.string :description
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
