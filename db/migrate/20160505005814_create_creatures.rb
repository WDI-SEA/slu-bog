class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :username
      t.text :creature

      t.timestamps null: false
    end
  end
end
