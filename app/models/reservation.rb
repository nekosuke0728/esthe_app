class Reservation < ApplicationRecord
  
  belongs_to :esthe_menu
  belongs_to :user
  belongs_to :time_table

end
