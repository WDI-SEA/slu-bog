class CreateDragQueens < ActiveRecord::Migration
  def change
    create_table :drag_queens do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
