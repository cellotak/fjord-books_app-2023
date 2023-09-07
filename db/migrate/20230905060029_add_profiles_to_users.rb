class AddProfilesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :postalcode, :string
    add_column :users, :introduction, :text
  end
end
