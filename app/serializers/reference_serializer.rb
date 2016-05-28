class ReferenceSerializer
  def self.serialize(reference)
    serialized_reference = '{'

    serialized_reference += '"id": ' + reference.id.to_s + ', '
    serialized_reference += '"name": "' + reference.name + '", '
    serialized_reference += '"link": "' + reference.reference_link + '" '


    serialized_reference += '}'
  end
end
