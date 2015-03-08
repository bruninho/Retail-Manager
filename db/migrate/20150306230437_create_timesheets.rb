class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :week_no
      t.float :basic_hours
      t.float :sunday_hours
      t.references :employee, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
