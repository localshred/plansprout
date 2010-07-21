class Idea < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_length_of :title, :maximum => 100
  validates_length_of :description, :maximum => 200
  
  belongs_to :user
  has_many :notes
end
