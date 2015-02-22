class DropTimesheetTables < ActiveRecord::Migration
  def change
      drop_table :timesheets
      drop_table :emp_timesheet
  end
end
