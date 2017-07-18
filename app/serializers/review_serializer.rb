class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :university_id, :author, :content, :content, :rating

  belongs_to :university
end
