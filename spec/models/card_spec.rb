require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe '新規カード登録' do
    context '登録できるとき' do
      it '全ての項目が確認できれば登録できる' do
        expect(@card).to be_valid
      end
    end

    context '登録できないとき' do
      it 'カードトークンが必須であること' do
        @card.card_token = ''
        @card.valid?
        expect(@card.errors.full_messages).to include('カードを入力してください')
      end
      it 'カスタマートークンが必須であること' do
        @card.customer_token = ''
        @card.valid?
        expect(@card.errors.full_messages).to include('カスタマー情報を入力してください')
      end
      it 'カード情報トークンが必須であること' do
        @card.customercard_token = ''
        @card.valid?
        expect(@card.errors.full_messages).to include('カード情報を入力してください')
      end
    end
  end
end
