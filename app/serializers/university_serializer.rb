class UniversitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :population, :mascot

  has_many :reviews
end
