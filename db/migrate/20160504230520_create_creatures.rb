class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :species
      t.text :description
      t.text :location

      t.timestamps null: false
    end
  end
end
