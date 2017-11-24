class TimeTable < ApplicationRecord
  has_one :reservation
  TIME_FRAME = { "10:00-11:00": 0,
                 "11:00-12:00": 1,
                 "12:00-13:00": 2,
                 "13:00-14:00": 3,
                 "14:00-15:00": 4,
                 "15:00-16:00": 5,
                 "16:00-17:00": 6,
                 "17:00-18:00": 7,
                 "18:00-19:00": 8,
                 "19:00-20:00": 9
               }
   enum time_frame: TIME_FRAME
   def time_frame_enum
     TIME_FRAME
   end

   def get_vacancy(date, time_frame)

     model = TimeTable.where(:select_date => date, :time_frame => time_frame).first

     if model.nil?
       result = "ー"
     elsif  model.status == true
       result = "◯"
     else  model.status == false
       result = "✕"
     end
     return result
   end

   # day =  Date.today + date.day
   # model = TimeTable.where(:select_date => day, :time_frame => time_frame).first
   #   if model.nil? #ハイフン
   #     result = "-"
   #   elsif model.status == true
   #     result = "○"
   #   else #false
   #     result = "☓"
   #   end
   #   return result
   # end

   # date 日付
   # time_tablesテーブルでselect_dateがdateと同じものでかつ
   # time_frameがtime_frame[1]と同じでかつ
   # statusがtrueなら　→　○
   # falseなら　→　✕
   # 一致するものがなければ　→　-

end
