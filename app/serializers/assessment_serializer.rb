class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :link
  has_one   :user
  has_many  :skills
  has_many  :comments
  has_many  :assessment_contributers
end
