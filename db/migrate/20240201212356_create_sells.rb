class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.string :name
      t.string :lastName
      t.string :phone
      t.string :email
      t.text :content
      t.references :locality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
