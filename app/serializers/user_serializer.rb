class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :assessment_contributers
  has_many :assessments
end
