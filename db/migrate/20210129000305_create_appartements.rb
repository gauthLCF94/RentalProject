class CreateAppartements < ActiveRecord::Migration[6.1]
  def change
    create_table :appartements do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :address
      t.integer :postcode
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
