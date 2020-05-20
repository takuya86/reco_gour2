class User < ApplicationRecord
  mount_uploader :image, ImageUploader #carrierwave追加
  attr_accessor :remember_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      where(['username LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
      User.all #全て表示させる
    end
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
