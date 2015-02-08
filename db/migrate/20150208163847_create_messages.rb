class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :subject
      t.text :content
      t.integer :receiver
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
