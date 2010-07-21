class Note < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_length_of :title, :maximum => 100

  belongs_to :idea
  belongs_to :user
end
