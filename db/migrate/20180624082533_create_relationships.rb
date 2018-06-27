class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :nazo_id
      t.boolean :ac

      t.timestamps
    end
		add_index :relationships, :nazo_id
  end
end
