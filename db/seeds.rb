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
    end
    puts "Created #{University.count} universities"
  end
end

Seed.begin
