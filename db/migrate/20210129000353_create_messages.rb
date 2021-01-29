class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :contenu
      t.references :user, null: false, foreign_key: true
      t.references :appartement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
