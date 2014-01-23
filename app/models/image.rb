class Image < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  before_save :update_image_attributes

  belongs_to :artist, foreign_key: :imageable_id, foreign_type: "Artist"
  belongs_to :imageable, polymorphic: true
  belongs_to :producer, foreign_key: :imageable_id, foreign_type: "Producer"
  belongs_to :showcase, foreign_key: :imageable_id, foreign_type: "Showcase"
  belongs_to :vineyard, foreign_key: :imageable_id, foreign_type: "Vineyard"
  belongs_to :winery, foreign_key: :imageable_id, foreign_type: "Winery"
  belongs_to :user

  has_many :carousels_images
  has_many :carousels, through: :carousels_images
  
  validates :user, presence: true
  validates :imageable_type, presence: true
  validates :imageable_id, presence: true

private

  def update_image_attributes
    if image.present? && image_changed?
      self.content_type = image.file.content_type
      self.file_size = image.file.size 
    end
  end
end
