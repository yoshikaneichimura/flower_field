class PostImage < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :user
  has_one_attached :image

  def get_image(width,height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    image.variant(resize_to_limit:[width,height]).processed
  end

  def self.search(search)
    return PostImage.all unless search
    PostImage.where(['flower LIKE ?' , "%#{search}%"])
  end
end
