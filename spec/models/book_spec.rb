require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '新規予約登録' do
    context '登録できるとき' do
      it '全ての項目が確認できれば登録できる' do
        expect(@book).to be_valid
      end
    end

    context '登録できないとき' do
      it '開始時間が必須であること' do
        @book.start_time = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('開始時間を入力してください')
      end
      it '終了時間が必須であること' do
        @book.end_time = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('終了時間を入力してください')
      end
      it '料金入力が必須であること' do
        @book.price = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('料金（円）を入力してください')
      end
    end
  end
end
