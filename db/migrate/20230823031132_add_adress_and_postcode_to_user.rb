class AddAdressAndPostcodeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :adress, :string
    add_column :users, :postcode, :string
  end
end
