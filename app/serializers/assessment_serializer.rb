class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_many :skills  
end
