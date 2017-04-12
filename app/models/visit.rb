class Visit < ApplicationRecord
  validates :user_id, presence: true
  validates :shortened_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    u_id = user.id
    shortened_id = shortened_url.id

    Visit.create!(user_id: u_id, shortened_url_id: shortened_id)
  end

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :sites,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl
end
