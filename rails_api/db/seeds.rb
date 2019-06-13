# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def info(msg)
  puts "+ #{msg}"
end

info "evaluating a slow db:seed"

n = 30
n.times do |i|
  t = Thing.create!
  info "[#{i + 1}/#{n}] thing: #{t.id} \t created: #{t.created_at.in_time_zone('America/New_York')}"
  sleep 2
end
puts

info "db now has #{Thing.count} things"
