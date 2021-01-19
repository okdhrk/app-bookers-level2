class Book < ApplicationRecord

  belongs_to :user
  attachment :image
  # ↑画像アップ用いるか？

end
