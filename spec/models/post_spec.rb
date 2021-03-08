require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '店舗新規登録' do
    context '登録できるとき' do
      it '全ての項目が確認できれば登録できる' do
        expect(@post).to be_valid
      end
    end

    context '登録できないとき' do
      it '画像が必須であること' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('画像を入力してください')
      end
      it '店舗名が必須であること' do
        @post.name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('店舗名を入力してください')
      end
      it '施設説明が必須であること' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('施設説明を入力してください')
      end
      it '都道府県が必須であること' do
        @post.prefecture_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('都道府県は数値で入力してください')
      end
      it '都道府県idに0が選択されている' do
        @post.prefecture_id = 0
        @post.valid?
        expect(@post.errors.full_messages).to include('都道府県は0以外の値にしてください')
      end
      it '市区町村が必須であること' do
        @post.city = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('市区町村を入力してください')
      end

      it '番地が必須であること' do
        @post.address = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('番地を入力してください')
      end
      it '番地が必須であること' do
        @post.address = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('番地を入力してください')
      end
      it '料金説明が必須であること' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('料金説明を入力してください')
      end
      it '営業時間が必須であること' do
        @post.bus_hours = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('営業時間を入力してください')
      end
      it '施設アイテムが必須であること' do
        @post.item = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('施設アイテムを入力してください')
      end
    end
  end
end
