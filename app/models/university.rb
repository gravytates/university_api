class University < ApplicationRecord
  validates :name, :description, :population, :mascot, presence: true

  scope :search_by_name, -> (name) { where("name like ?", "%#{name}%") }

  scope :search_by_description, -> (description) { where("description like ?", "%#{description}%") }

  scope :search_by_population, -> (population) { where("population like ?", "%#{population}%" ) }
  
  scope :search_by_mascot, -> (mascot) { where("mascot like ?", "%#{mascot}%") }

end
