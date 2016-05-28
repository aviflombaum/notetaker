class ReferenceSerializer < ActiveModel::Serializer
  attributes :id, :name, :reference_link
#   def self.serialize(reference)
#     serialized_reference = '{'
#
#     serialized_reference += '"id": ' + reference.id.to_s + ', '
#     serialized_reference += '"name": "' + reference.name + '", '
#     serialized_reference += '"link": "' + reference.reference_link + '" '
#
#
#     serialized_reference += '}'
#   end
end
