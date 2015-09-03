User.create(email: 'tech-camp@gmail.com', password: '12345678', nickname: "Mako")

require "csv"
 
tweets_csv = CSV.readlines("db/tweets.csv")
tweets_csv.shift
tweets_csv.each do |row|
  Tweet.create(name: row[1], text: row[2], image: row[3], created_at: row[4], updated_at: row[5], user_id: row[6])
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
