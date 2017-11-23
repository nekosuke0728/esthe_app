class Reservation < ApplicationRecord
  belongs_to :esthe_menu
  belongs_to :user
  belongs_to :time_table

  # scope :today_1_time_10
  # scope :today_1_time_11
  # scope :today_1_time_12
  # scope :today_1_time_13
  # scope :today_1_time_14
  # scope :today_1_time_15
  # scope :today_1_time_16
  # scope :today_1_time_17

end