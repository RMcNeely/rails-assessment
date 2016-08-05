class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  validates :name, :email, presence: true, uniqueness: true

  has_many  :comments
  has_many  :assessments
  has_many  :assessment_contributers, through: :assessments
  has_many  :assessment_skills, through: :assessments
  has_many  :skills, through: :assessments

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.extra.raw_info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end


end
