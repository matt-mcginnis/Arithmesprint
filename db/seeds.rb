# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate Some Addition Problems
10.times do |i|
    10.times do |j|
        Problem.create({problem_type: "addition", question: "#{i} + #{j} = ?", answer: "#{i+j}"})
    end
end
