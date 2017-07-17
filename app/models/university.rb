class University < ApplicationRecord
  validates :name, :description, :population, :mascot, presence: true

  scope :search, -> (name) { where("name like ?", "%#{name}%") }

end
