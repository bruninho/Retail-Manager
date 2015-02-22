class CreateTimesheetPayments < ActiveRecord::Migration
  
    def change
      create_table :timesheet_payments do |t|
          t.references :employee
          t.references :timesheet
          t.float :basic_hours
          t.float :sunday_bh_hours
          t.timestamps null: false
    end
      add_index :timesheet_payments, ["employee_id", "timesheet_id"]
  end
    
end
