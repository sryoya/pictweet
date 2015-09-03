User.create(email: 'tech-camp@gmail.com', password: '12345678', nickname: "Mako")

require "csv"
 
tweets_csv = CSV.readlines("db/tweets.csv")
tweets_csv.shift
tweets_csv.each do |row|
  Tweet.create(text: row[1], image: row[2],user_id: row[5])
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
