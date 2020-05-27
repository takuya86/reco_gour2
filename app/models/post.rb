class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader #carrierwave追加
  attr_accessor :remember_token

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
      Post.all #全て表示させる
    end
  end
end
