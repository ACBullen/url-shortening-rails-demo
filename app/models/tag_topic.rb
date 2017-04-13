class TagTopic < ApplicationRecord
  validates :tag, presence: true, uniqueness: true

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :shortened_urls,
    Proc.new { distinct },
    through: :taggings,
    source: :shortened_url

  def popular_links
    all_links = self.shortened_urls
    all_links.sort_by(&:num_clicks).reverse![0..4]
  end
end
