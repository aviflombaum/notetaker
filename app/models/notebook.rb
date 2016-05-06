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

  def note_count
    self.notes.count
  end

  def reference_count
    self.references.count
  end

  def self.by_user(user_id)
    where(user: user_id)
  end


end
