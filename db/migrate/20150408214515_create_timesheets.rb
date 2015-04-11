class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :payroll_id
      t.integer :employee_id
      t.float :basic_hours
      t.float :sunday_hours

      t.timestamps null: false
    end
  end
end
