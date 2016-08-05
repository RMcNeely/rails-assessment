class AssessmentContributerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :assessment_id, :contributer_name
  has_one :assessment
  has_one :user
end
