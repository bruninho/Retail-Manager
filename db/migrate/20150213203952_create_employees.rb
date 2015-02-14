class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.string :store
      t.date :dob
      t.float :basic_rop
      t.float :sunday_bh_rop
      t.string :email
      t.date :date_joined

      t.timestamps null: false
    end
  end
end
