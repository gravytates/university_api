class University < ApplicationRecord
  validates :name, :description, :population, :mascot, presence: true
end
