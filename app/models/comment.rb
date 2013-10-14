class Comment < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :comments

  belongs_to :timeline,
    inverse_of: :comments

  belongs_to :photo,
    inverse_of: :comments

  validates_presence_of :content 
  validates_length_of :content, 
    :minimum => 2,
    :maximum => 330,
    :short => "Tell us more! (Add some words)"
  
  validates_presence_of :user_id
  validates_presence_of :timeline_id
end
