class Assessment < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  has_many :assessments_skills

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

end
