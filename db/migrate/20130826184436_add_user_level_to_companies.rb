class AddUserLevelToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :user_level, :integer
  end
end
