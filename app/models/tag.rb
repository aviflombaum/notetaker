class Tag < ActiveRecord::Base
  has_many :notes
  has_many :notes, through: :note_tags
end
