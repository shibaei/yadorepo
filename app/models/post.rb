class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place

  has_many_attached :images

  validates :title,	:hotel,	:room,	:check_in,	:check_out,	:text,:images, presence: true

  belongs_to :user  

  validates :images, length: { minimum: 1, maximum: 10, message: "は1枚以上10枚以下にしてください" }

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :place_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
