class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :references, through: :notes

  validates_presence_of :title

end
