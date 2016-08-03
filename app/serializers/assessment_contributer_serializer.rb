class AssessmentContributerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :assessment_id
  has_one :assessment
  has_many :users
end
