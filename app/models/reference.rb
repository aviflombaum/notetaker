class Reference < ActiveRecord::Base
  has_many :notes
  has_many :notebooks, through: :notes

  validates_presence_of :reference_link
end
