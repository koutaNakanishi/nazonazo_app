class ChangeEmailToLoginid < ActiveRecord::Migration[5.1]
  def change
		rename_column :users, :email , :login_id 
  end
end
