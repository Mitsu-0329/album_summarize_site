class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image

  before_validation :family_code_check

  validates :name, presence: true
  validates :email, presence: true
  validates :profile_image, presence: true

  #@user=User.find(1) # ユーザーidが1の1レコードを取得
  #@user.destroy # ユーザidが1の1レコードを削除

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  private
  
  def family_code_check
    if self.family_code.present?
      # ファミリーが登録した時の動き
      if !User.find_by(family_code: self.family_code)
        errors.add(:family_code, "は不正な値です。")
      end
    else
      # 新規登録の時の動き
      loop do
        self.family_code = SecureRandom.hex(12)
        break unless User.find_by(family_code: self.family_code)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
