class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place

  has_one_attached :image

  validates :title,	:hotel,	:room,	:check_in,	:check_out,	:text,:image, presence: true

  belongs_to :user  

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :place_id, numericality: { other_than: 1 , message: "can't be blank"} 

end