class CreateCreaturesTags < ActiveRecord::Migration
  def change
    create_table :creatures_tags do |t|

      t.timestamps null: false
    end
  end
end
