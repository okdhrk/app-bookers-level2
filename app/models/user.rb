class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # :database_authenticatable（パスワードの正確性を検証）
  # :registerable（ユーザ登録や編集、削除）
  # :recoverable（パスワードをリセット）
  # :rememberable（ログイン情報を保存）
  # :validatable（emailのフォーマットなどのバリデーション）

  has_many :books, dependent: :destroy
  # bookモデルの関連付け
  attachment :profile_image

  validatable :name, presence: true, length: { in: 2..20 }
  validatable :body, presence: true, length: { maximum: 50 }

end
