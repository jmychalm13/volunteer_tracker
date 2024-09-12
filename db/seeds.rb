puts "seeding started"

10.times do
  Event.create(
    name: Faker::DcComics.title,
    date: Faker::Date.between(from: "2024-09-09", to: "2024-12-31").to_datetime,
    description: Faker::Lorem.words(number: 10).join(" ")
  )
end

puts "seeding complete"
