class ShortenedUrl
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, uniqueness: true, presence: true

  belongs_to :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  def self.create_url(user, long_url)
    ShortenedUrl.create!(
      long_url: long_url,
      user_id: user.id,
      short_url: ShortenedUrl.random_code
    )
  end

  def self.random_code
    short = SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(short_url: short)
      short = SecureRandom.urlsafe_base64(16)
    end
    short
  end


  end

  (#something that checks if genereated 16-byte code already exists in table)


end
