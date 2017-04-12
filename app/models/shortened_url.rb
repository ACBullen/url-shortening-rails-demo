class ShortenedUrl < ApplicationRecord
  def self.random_code
    short_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(shortened_url: short_url)
      short_url = SecureRandom.urlsafe_base64
    end

    short_url
  end

  def self.shorten_my_url(me, url)
    raise "Not a user" unless me.class == User
    ShortenedUrl.create!(user_id: me.id, long_url: url, shortened_url: ShortenedUrl.random_code)
  end

  def num_clicks
    self.visits.length
  end

  def num_uniques
    self.visitors.length
  end

  def num_recent_uniques
    query_time = Time.now
    self.visits.where({ created_at: (10.minutes.ago)..(query_time)}).length
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :users
end
