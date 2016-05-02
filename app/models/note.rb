class Note < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :reference
  accepts_nested_attributes_for :notebook
  accepts_nested_attributes_for :reference

  validates_presence_of :name, :content
end
