class TagTopic < ApplicationRecord
  validates :tag, presence: true, uniqueness: true
end
