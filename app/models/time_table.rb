class TimeTable < ApplicationRecord
  has_many :time_tables

  enum time_frame: { "10:00-11:00": 0, "11:00-12:00": 1, "12:00-13:00": 2 }
end
