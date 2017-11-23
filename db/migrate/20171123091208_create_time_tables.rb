class CreateTimeTables < ActiveRecord::Migration[5.1]
  def change
    create_table :time_tables do |t|
      t.date :select_date
      t.integer :time_frame
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
