class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image
      t.decimal :price, precision: 8, scale: 2
      t.boolean :active
      t.belongs_to :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
