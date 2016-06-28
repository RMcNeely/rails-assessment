class Skill < ActiveRecord::Base
  has_many :assessment_skills
  validates :name, presence: true

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.unique_skills
    pants = Skill.all.map {|x| x.name}.uniq
    pants_objects = pants.map {|x| Skill.find_by(name: x)}
  end
end
