class Article < ApplicationRecord
  scope :with_video_type, ->{where(type: :video)}
  scope :popular, ->{where("view_count > ?", 100)}
  scope :popular_with_video_type, ->{popular.with_video_type}
end
