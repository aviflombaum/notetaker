class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :references, through: :notes

  validates_presence_of :title

  def notes_attributes=(note_attributes)
    note_attributes.values.each do |note_attr|
      note = Note.create(note_attr)
      self.notes << note
    end
  end

end
