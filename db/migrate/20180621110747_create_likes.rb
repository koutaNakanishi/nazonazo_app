class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.integer :likes_count

      t.timestamps
    end
  end
end
