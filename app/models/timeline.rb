class Timeline < ActiveRecord::Base
  belongs_to :user

  has_many :photos, through: :timelines,
    inverse_of: :timeline,
    dependent: :destroy

  has_many :comments, through: :photos,
    inverse_of: :timeline,
    dependent: :destroy

  validates_presence_of :title
  # validates_presence_of :user_id
end
