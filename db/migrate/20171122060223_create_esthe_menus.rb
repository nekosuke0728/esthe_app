class CreateEstheMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :esthe_menus do |t|
      t.string :name
      t.integer :time_frame
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
