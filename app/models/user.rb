class User < ActiveRecord::Base
  has_secure_password
  has_many :teams

  validates_presence_of :username, :email, :password
  validates :username, :uniqueness => true
  validates :email, :uniqueness => true

  def slug
    username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end


end
