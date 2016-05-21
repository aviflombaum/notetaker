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

end
