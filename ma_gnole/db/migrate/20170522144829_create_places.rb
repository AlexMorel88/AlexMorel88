class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :description
      t.string :photo
      t.integer :nbr_person
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
