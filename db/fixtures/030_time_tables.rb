require "csv"

CSV.foreach('db/fixtures/seed_time_tables.csv') do |row|
  TimeTable.seed (:id) do |t|
    t.id = row[0]
    t.select_date = row[1]
    t.time_frame = row[2]
  end
end
