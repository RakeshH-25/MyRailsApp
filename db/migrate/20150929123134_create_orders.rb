class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :contact_no
      t.string :pay_type
      t.text :address
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
