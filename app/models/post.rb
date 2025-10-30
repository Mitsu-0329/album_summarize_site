class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :post_image

    #titleが存在しているかを確認するバリデーション
    validates :title, presence: true
    #bodyが存在しているかを確認するバリデーション
    validates :body, presence: true, length: { maximum: 200 }
    #post_imageが存在しているかを確認するバリデーション
    validates :post_image, presence: true  


    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end

end
