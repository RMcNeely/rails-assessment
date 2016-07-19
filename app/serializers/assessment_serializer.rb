class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :link
  has_one :user
  has_many :skills
end
