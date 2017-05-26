class CreateAvailibilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availibilities do |t|
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
