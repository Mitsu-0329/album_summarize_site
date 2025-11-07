class Group < ApplicationRecord
  belongs_to :user,foreign_key: "owner_id"
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


end
