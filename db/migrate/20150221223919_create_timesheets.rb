class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :upload_date
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
