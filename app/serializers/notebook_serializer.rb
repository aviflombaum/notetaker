class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :notes, serializer: NotebookNoteSerializer
  has_many :references, serializer: NoteReferenceSerializer

end
