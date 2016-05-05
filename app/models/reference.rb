class Reference < ActiveRecord::Base
  has_many :notes
  has_many :notebooks, through: :notes

  validates_presence_of :reference_link
  validates :reference_link, :format => {:with => URI::regexp(%w(http https)), :message => "must be a valid"}

  def self.recently_added
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end

end
