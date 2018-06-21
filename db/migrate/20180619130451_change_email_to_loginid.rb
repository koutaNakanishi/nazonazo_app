class ChangeEmailToLoginid < ActiveRecord::Migration[5.1]
  def change
		rename_column :users, :email , :login_id 
		rename_column :likes, :tweet_id, :nazo_id
  end
end
