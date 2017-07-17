class Seed
  def self.begin
    seed = Seed.new
    seed.generate_universities
  end

  def generate_universities
    20.times do |i|
      university = University.create!(
        name: Faker::University.unique.name,
        description: Faker::Coffee.unique.notes,
        population: Faker::Number.between(100, 70000),
        mascot: Faker::Team.unique.creature
      )
    end
  end
end
puts "Created #{University.count} universities"

Seed.begin
