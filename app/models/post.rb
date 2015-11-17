class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 10..100 }
  validates :link, presence: true
  validates_format_of :link, with:=> URI.regexp, if: "link.present?"

end
