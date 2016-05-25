class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :notes, serializer: NotebookNoteSerializer

end
