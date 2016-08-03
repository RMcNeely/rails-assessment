class AssessmentContributer < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :user

  validates :assessment_id, presence: true #, if: :contributer_cannot_be_owner

  validates :user_id, presence: true
  validate :contributer_cannot_be_owner

  def contributer_cannot_be_owner
    if self.assessment.user == self.user
      errors.add(:contributer_cant_be_owner, "The assessment's contributer cannot be the same person who owns the assessment")
    end
  end
end
