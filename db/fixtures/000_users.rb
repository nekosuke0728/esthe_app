require "csv"

CSV.foreach('db/fixtures/seed_users.csv') do |row|
  User.seed (:id) do |u|
    u.id = row[0]
    u.email = row[1]
    u.password = row[2]
    u.name = row[3]
    u.phone = row[4]
  end
end