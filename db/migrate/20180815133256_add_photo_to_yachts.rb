class AddPhotoToYachts < ActiveRecord::Migration[5.2]
  def change
    add_column :yachts, :photo, :string
  end
end
