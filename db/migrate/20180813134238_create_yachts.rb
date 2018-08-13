class CreateYachts < ActiveRecord::Migration[5.2]
  def change
    create_table :yachts do |t|
      t.string :name
      t.string :location
      t.string :boat_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
