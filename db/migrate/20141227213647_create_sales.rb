class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :total
      t.float :profit
      t.float :credit
      t.float :cash

      t.timestamps null: false
    end
  end
end
