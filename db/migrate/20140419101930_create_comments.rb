class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :memo
      t.integer :need_id
      t.integer :staff_id

      t.timestamps
    end
  end
end
