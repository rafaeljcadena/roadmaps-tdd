class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :nome
      t.float :price
      t.string :status
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
