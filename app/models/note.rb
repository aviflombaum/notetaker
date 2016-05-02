class Note < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :reference

  validates_presence_of :name, :content
end
