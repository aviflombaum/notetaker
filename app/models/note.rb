class Note < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :reference

  validates :name, :presence => true
  validates :content, :presence => true



  def references_attributes=(references_hashes)
    references_hashes.each do |i, reference_attributes|
      self.references.find_by(title: reference_attributes[:reference_link])
    end
  end


  def self.without_a_reference
    where(reference_id: nil)
  end

end
