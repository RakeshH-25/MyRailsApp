class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :contact_no
      t.text :address
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
