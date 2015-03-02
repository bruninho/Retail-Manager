class DropTimesheetsTable < ActiveRecord::Migration
  def change
  	  drop_table :timesheets
      drop_table :timesheet_payments
  end
end
