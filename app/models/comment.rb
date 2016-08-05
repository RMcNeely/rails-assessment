class Comment < ActiveRecord::Base
  belongs_to  :assessment
  belongs_to  :user
  validates :text, :assessment_id, presence: true

  after_initialize do |comment|
    if comment.user
      comment.by = comment.user.name
    else
      comment.by = "Anonymous"
    end
    comment.save
  end

end
