class CreateMonologueAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :monologue_assets do |t|
      t.string :file_name
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
