class Note < ActiveRecord::Base
  belongs_to :notebook

  validates_presence_of :name, :content
end
