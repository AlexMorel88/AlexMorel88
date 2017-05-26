class AddPriceToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :price, :integer
  end
end
