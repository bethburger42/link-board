class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 10..100 }
  validates :link, presence: true
  validates :link, :format => URI::regexp(%w(http https))

end
