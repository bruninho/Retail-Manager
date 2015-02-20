class CreateEmployees < ActiveRecord::Migration
drop_table :employees if table_exists? :employees
  def change
    create_table :employees do |t|
      t.string :pps_no
      t.string :fname
      t.string :lname
      t.date :dob
      t.text :address
      t.string :ph_number
      t.float :basic_rop
      t.float :sunday_bh_rop
      t.string :email
      t.date :date_joined
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
