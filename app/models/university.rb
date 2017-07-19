class University < ApplicationRecord
  has_many :reviews
  validates :name, :description, :population, :mascot, presence: true

  scope :search_by_name, -> (name) { where("lower(name) like ?", "%#{name.downcase}%") }

  scope :search_by_description, -> (description) { where("lower(description) like ?", "%#{description.downcase}%") }

  scope :search_by_population, -> (population) { where("population = ?", population ) }

  scope :search_by_mascot, -> (mascot) { where("lower(mascot) like ?", "%#{mascot.downcase}%") }

end
