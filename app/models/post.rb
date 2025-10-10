class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_one_attached :post_image

    #titleが存在しているかを確認するバリデーション
    validates :title, presence: true
    #bodyが存在しているかを確認するバリデーション
    validates :body, presence: true, length: { maximum: 200 }
  

end
