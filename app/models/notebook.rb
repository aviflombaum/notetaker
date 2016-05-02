class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  validates_presence_of :title


  accepts_nested_attributes_for :notes #### CHANGE TO CUSTOM ATTR WRITER
end
