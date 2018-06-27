class CreateNazos < ActiveRecord::Migration[5.1]
  def change
    create_table :nazos do |t|
      t.text :content
      t.string :answer
      t.integer :difficulty
      t.integer :good_num,default:0
      t.integer :fight_num,default:0
      t.integer :solved_num,default:0
      t.references :user, foreign_key: true

      t.timestamps
    end
		add_index :nazos, [:user_id, :created_at, :good_num]
  end
end
