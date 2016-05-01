class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  accepts_nested_attributes_for :notes #### CHANGE TO CUSTOM ATTR WRITER
end
