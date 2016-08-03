class Assessment < ActiveRecord::Base
  has_many :assessment_skills
  has_many :skills, through: :assessment_skills
  belongs_to :user

  accepts_nested_attributes_for :skills, reject_if: :all_blank

  scope :mastered, -> { where(mastered: true)}

  validates :name, :link, presence: true

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def created_by
    self.user.name
  end

  def skills_attributes=(skills_attributes)
    skills_attributes.each do |key, attr_value|
      if !attr_value[:name].empty?
        binding.pry
        skill = Skill.find_or_create_by(attr_value)
        self.skills << skill
      end
    end
  end

  def new_skill
  end

  def create_new_skill
    Skill.find_or_create_by(name: users_params[:create_new_skill])
  end

  def add_new_tested_skills
  end

  def add_new_skills(params)
    new_skill = params[:before_add_for_skills]
      Skill.create(assessment_id: self.id, user_id: self.id, name: new_skill)
  end

  def associate_skills_to_assessment(params)
    if params[:skill_ids]
      params[:skill_ids].each do |x|
        Skill.create(assessment_id: self.id, user_id: self.id, name: Skill.find_by_id(x).name)
      end
    end
  end

  def self.next(current_id)
    Assessment.where('id > ?', current_id).order('id ASC').limit(1)
  end

  def self.prev(current_id)
    Assessment.where('id < ?', current_id).order('id DESC').limit(1)
  end

  def self.find_by_slug_or_id(params)
    if params[:format] == 'json'
      @assessment = Assessment.find_by_id(params["data-id"])
    else
      @assessment = Assessment.find_by_slug(params[:slug])
    end
  end

end
