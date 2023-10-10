class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :quantity
      t.references :type, null: false, foreign_key: true
      t.references :composition, null: false, foreign_key: true
      t.references :locality, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
