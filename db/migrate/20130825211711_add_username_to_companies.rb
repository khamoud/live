class AddUsernameToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :username, :string
    add_index :companies, :username, :unique => true
  end
end
