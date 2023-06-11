require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe "バリデーション" do
    context 'postが投稿できる場合' do
      it "必要な属性が揃っている場合、有効である" do
        expect(@post).to be_valid
      end
    end

    context 'postが投稿できない場合' do
      it "titleがない場合、無効である" do
        @post.title = ''
        expect(@post).to be_invalid
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'place_idが空の場合、無効である' do
        @post.place_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Place can't be blank")
      end
      it 'place_idが1(---)の場合、無効である' do
        @post.place_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Place can't be blank")
      end
      it "hotelがない場合、無効である" do
        @post.hotel = ''
        expect(@post).to be_invalid
        expect(@post.errors.full_messages).to include("Hotel can't be blank")
      end
      it "roomがない場合、無効である" do
        @post.room = ''
        expect(@post).to be_invalid
        expect(@post.errors.full_messages).to include("Room can't be blank")
      end

      it "check_inがない場合、無効である" do
        @post.check_in = ''
        expect(@post).to be_invalid
        expect(@post.errors.full_messages).to include("Check in can't be blank")
      end

      it "check_outがない場合、無効である" do
        @post.check_out = ''
        expect(@post).to be_invalid
        expect(@post.errors.full_messages).to include("Check out can't be blank")
      end

      it "textがない場合、無効である" do
        @post.text = ''
        expect(@post).to be_invalid
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end

      it "画像がない場合、無効である" do
        @post.images = nil
        expect(@post).to be_invalid
        expect(@post.errors[:images]).to include("は1枚以上10枚以下にしてください")
      end

      it "11枚以上の画像がある場合、無効である" do
        11.times do
          @post.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        end
        expect(@post).to be_invalid
        expect(@post.errors[:images]).to include("は1枚以上10枚以下にしてください")
      end

      it 'userが紐付いていないと、無効である' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end

     end
    end
end
