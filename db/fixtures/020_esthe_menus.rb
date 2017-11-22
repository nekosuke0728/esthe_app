require "csv"

CSV.foreach('db/fixtures/seed_esthe_menus.csv') do |row|
  EstheMenu.seed (:id) do |e|
    e.id = row[0]
    e.name = row[1]
    e.time_frame = row[2]
    e.price = row[3]
    e.description = row[4]
  end
end