require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe "バリデーション" do
    it "必要な属性が揃っている場合、有効であること" do
      expect(@post).to be_valid
    end

    it "画像がない場合、無効であること" do
      @post.images = nil
      expect(@post).to be_invalid
      expect(@post.errors[:images]).to include("は1枚以上10枚以下にしてください")
    end

    it "11枚以上の画像がある場合、無効であること" do
      11.times do
        @post.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
      expect(@post).to be_invalid
      expect(@post.errors[:images]).to include("は1枚以上10枚以下にしてください")
    end
  end
end
