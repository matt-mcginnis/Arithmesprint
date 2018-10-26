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

#Generate Subtraction Problems
10.times do |i|
    i.times do |j|
        Problem.create({problem_type: "subtraction", question: "#{i} - #{j} = ?", answer: "#{i-j}"})
    end
end

#Generate Multiplication Problems
10.times do |i|
    10.times do |j|
        Problem.create({problem_type: "multiplication", question: "#{i} #{215.chr("UTF-8")} #{j} = ?", answer: "#{i * j}"})
    end
end

#Generate Division Problems
100.times do |i|
    i.times do |j|
        if (j > 0) && (i % j == 0)
            Problem.create({problem_type: "division", question: "#{i} #{247.chr("UTF-8")} #{j} = ?", answer: "#{i / j}"})
        end
    end
end
