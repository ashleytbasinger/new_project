class User < ActiveRecord::Base
  has_many :timelines,
    inverse_of: :user,
    dependent: :destroy

  has_many :photos, through: :timelines,
  inverse_of: :user

  has_many :comments, through: :photos,
    inverse_of: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_presence_of :email

  validates_uniqueness_of :username
  validates_format_of :email, 
    with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  PRIVACY = %w{private public}

  validates_inclusion_of :account_privacy, in: PRIVACY

  accepts_nested_attributes_for :timelines,
    reject_if: proc { |a| a[:sets].blank?; },
    allow_destroy: true
end
