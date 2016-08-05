class AssessmentContributer < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :user
  validates :assessment_id, presence: true #, if: :contributer_cannot_be_owner

  validates :user_id, presence: true
  validate :contributer_cannot_be_owner

  after_initialize do |ac|
    ac.contributer_name = ac.user.name
    ac.save
  end

  def contributer_cannot_be_owner
    if self.assessment.user == self.user
      errors.add(:contributer_cant_be_owner, "The assessment's contributer cannot be the same person who owns the assessment")
    end
  end

  def self.create_new(array, assessment)
    if array
      array.each do |x|
        self.create(assessment_id: assessment.id, user_id: x)
      end
    end

  end
end
