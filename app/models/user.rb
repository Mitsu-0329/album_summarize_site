class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_one_attached :image

  before_validation :family_code_check

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  

  #@user=User.find(1) # ユーザーidが1の1レコードを取得
  #@user.destroy # ユーザidが1の1レコードを削除


  private
  
  def family_code_check
    if self.family_code.present?
      # ファミリーが登録した時の動き
      if User.find_by(family_code: self.family_code)
        return true
      else
        return false
      end
    else
      # 新規登録の時の動き
      loop do
        self.family_code = SecureRandom.hex(12)
        break unless User.find_by(family_code: self.family_code)
      end

      return true
    end
  end
end
