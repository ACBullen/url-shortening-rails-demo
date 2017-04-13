class Tagging < ApplicationRecord
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :shortened_id, presence: true

  belongs_to :tag_topic,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_id,
    class_name: :ShortenedUrl
end
