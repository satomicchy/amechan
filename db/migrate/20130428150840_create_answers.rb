class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :need_id
      t.text :memo
      t.date :plan_on

      t.timestamps
    end
  end
end
