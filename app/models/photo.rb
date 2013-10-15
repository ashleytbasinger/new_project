class Photo < ActiveRecord::Base
  # attr_accessor :timeline_id, :title, :image
  belongs_to :user

  belongs_to :timeline

  has_many :comments,
    inverse_of: :photo,
    dependent: :destroy

  validates_presence_of :title
  validates_presence_of :date
  validates_presence_of :image

  mount_uploader :image, ImageUploader

end
