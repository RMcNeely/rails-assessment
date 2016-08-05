class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :link#, :comment
  has_one :user
  has_many :skills
  has_many :assessment_contributers
end
