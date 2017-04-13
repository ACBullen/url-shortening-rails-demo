require 'byebug'
class ShortenedUrl < ApplicationRecord
# debugger
validate :nonpremium_max, :no_spamming

  def self.random_code
    short_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(shortened_url: short_url)
      short_url = SecureRandom.urlsafe_base64
    end

    short_url
  end

  def no_spamming
    cur_user = User.find_by(id: user_id)
    if cur_user.submitted_urls.where({ created_at: (1.minutes.ago)..(Time.now)}).length >= 5
      errors[:user_id] << "You done goofed trooped, chillax dog!!!"
    end
  end

  def self.prune(n)
    prunes = self.all.reject do |url|
      url.visits.where({ created_at: (n.minutes.ago)..(Time.now)}).length > 0
    end
    
    prunes.each(&:destroy)
  end

  def nonpremium_max
    cur_user = User.find_by(id: user_id)
    unless cur_user.premium
      if cur_user.submitted_urls.count >= 5
        errors[:user_id] << "You've run out of links dog. Sign up for premium to fresh-up your link count!"
      end
    end
  end

  def self.shorten_my_url(me, url)
    raise "Not a user" unless me.class == User
    ShortenedUrl.create(user_id: me.id, long_url: url, shortened_url: ShortenedUrl.random_code)
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

  has_many :taggings,
    primary_key: :id,
    foreign_key: :shortened_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic


end
