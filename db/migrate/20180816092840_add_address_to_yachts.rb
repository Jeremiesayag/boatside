class AddAddressToYachts < ActiveRecord::Migration[5.2]
  def change
    add_column :yachts, :address, :string
  end
end
