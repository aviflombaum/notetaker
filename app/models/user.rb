class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :notebooks
  has_many :references


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def notebook_count
    self.notebooks.count
  end

  def note_count #refactor? collect?
    all = []
    self.notebooks.each do |book|
      book.notes.each do |n|
        all << n
      end
    end
    all.count
  end

end
