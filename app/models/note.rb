class Note < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :reference

  has_many :note_tags
  has_many :tags, through: :note_tags

  validates :name, :presence => true
  validates :content, :presence => true



  def references_attributes=(references_hashes)
    references_hashes.each do |i, reference_attributes|
      self.references.find_by(title: reference_attributes[:reference_link])
    end
  end

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |i, tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

  def self.without_a_reference
    where(reference_id: nil)
  end

  def self.next_note
    where('id > @note').limit(1)
  end

end


#   SELECT * FROM Customers;
#
# SELECT * FROM customers WHERE id >= 4 LIMIT 2 ORDER BY ID asc
#   1
#   4 Yours
#   5 Mine
#   8
#   9

  # def self.find_next(reference)
  #   where(id: )
  #
  #   SELECT * from NOTES where id > @reference LIMIT 1
  # end
  # select the row beneath the current reference
