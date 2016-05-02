class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :notebook_tags
  has_many :tags, through: :notebook_tags
  validates_presence_of :title

end
