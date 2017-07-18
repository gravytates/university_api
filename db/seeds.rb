class Seed
  def self.begin
    seed = Seed.new
    seed.generate_universities
  end

  def generate_universities
    40.times do |i|
      university = University.create!(
        name: Faker::University.unique.name,
        description: Faker::Coffee.unique.notes,
        population: Faker::Number.between(100, 70000),
        mascot: Faker::Team.unique.creature
      )
      university.reviews.create!(university_id: university.id, author: 'Griggs', content: 'Waste of money', rating: Faker::Number.between(1,5))
    end
    puts "Created #{University.count} universities"
    puts "Created #{Review.count} reviews"

  end
end

Seed.begin
