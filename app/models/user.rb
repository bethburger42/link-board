class User < ActiveRecord::Base
  has_many :post

  validates :name, presence: true, length: { maximum: 20 }
	validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true

	has_secure_password

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
