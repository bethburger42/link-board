class User < ActiveRecord::Base

  has_many :link
  
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :name, presence: true, length: { maximum: 20 }

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates_presence_of :password, on: :create

	has_secure_password

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
