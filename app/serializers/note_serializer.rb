class NoteSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  has_one :reference, serializer: NoteReferenceSerializer

end
