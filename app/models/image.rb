class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      error.add(:picture, "The image should be less than 5Mo ")
    end
  end

end
