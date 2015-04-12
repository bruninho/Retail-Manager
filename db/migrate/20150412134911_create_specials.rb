class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :title
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
