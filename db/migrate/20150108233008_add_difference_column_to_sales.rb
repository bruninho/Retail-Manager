class AddDifferenceColumnToSales < ActiveRecord::Migration
  def change
    add_column :sales, :difference, :float
  end
end
