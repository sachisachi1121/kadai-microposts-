class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :likers, through: :favorites, source: :user

  def like?(user)
    # 指定されたユーザーが、
    # このマイクロポストをお気に入りにしているか？を返す
    # 結論 : true もしくは false が返ります
    favorites.where(user_id: user.id).exists?
  end

end
