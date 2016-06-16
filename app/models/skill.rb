class Skill < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :assessment

  scope :mastered, -> { where(mastered: true)}

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.unique_skills
    pants = Skill.all.map {|x| x.name}.uniq
    pants_objects = pants.map {|x| Skill.find_by(name: x)}
  end
end
