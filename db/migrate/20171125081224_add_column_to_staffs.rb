class AddColumnToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :name, :string, null: false, default: ""
  end
end
