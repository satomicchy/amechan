class AddAreaAndScheduleColumnToNeed < ActiveRecord::Migration
  def change
    add_column :needs, :area, :string
    add_column :needs, :schedule_on, :date
  end
end
