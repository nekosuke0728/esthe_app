class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :esthe_menu, foreign_key: true
      t.datetime :start_at
      t.text :comment
      t.timestamps
    end
  end
end
