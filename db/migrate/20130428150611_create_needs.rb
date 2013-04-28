class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :staff_id
      t.string :title
      t.text :content
      t.string :url
      t.string :status
      t.string :importance
      t.date :finish_on
      t.text :memo

      t.timestamps
    end
  end
end
