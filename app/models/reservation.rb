class Reservation < ApplicationRecord

  belongs_to :esthe_menu
  belongs_to :user
  belongs_to :time_table

  # validates :user_id, presence: true
  # validates :esthe_menu_id, presence: true
  # validates :time_table_id, presence: true

end
