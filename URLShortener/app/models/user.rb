class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  has_many :shortened_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :user_id

end
