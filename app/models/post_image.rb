class PostImage < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  has_many :post_comments, dependent: :destroy
  has_many :favorites

  has_one_attached :image

    validates :flower,presence: true
    validates :field, presence: true
    validates :day, numericality: {presence: true, message: "日付を入力して下さい"}
    validates :star, numericality: {presence: true, message: "開花状況を入力して下さい"}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

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
