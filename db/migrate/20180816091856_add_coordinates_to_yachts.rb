class AddCoordinatesToYachts < ActiveRecord::Migration[5.2]
  def change
    add_column :yachts, :latitude, :float
    add_column :yachts, :longitude, :float
  end
end
