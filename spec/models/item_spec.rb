require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品した商品の保存' do
      context '商品が保存できるとき' do
        it 'image、name、discription、category_id、condition_id、postage_payer_id、prefecture_id、handing_time_id、priceが存在すれば保存できること' do
          expect(@item).to be_valid
        end

        it 'priceが、半角数字であれば登録できること' do
          @item.price = 1000
          expect(@item).to be_valid
        end
      end

      context '商品が保存できないとき' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'discriptionが空では登録できないこと' do
          @item.discription = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Discription can't be blank")
        end

        it 'category_idが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'condition_idが空では登録できないこと' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it 'postage_payer_idが空では登録できないこと' do
          @item.postage_payer_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage payer can't be blank")
        end

        it 'prefecture_idが空では登録できないこと' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'handing_time_idが空では登録できないこと' do
          @item.handing_time_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Handing time can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが299以下の場合登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 299')
        end

        it 'priceが10000000以上の場合は登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than 10000000')
        end

        it 'category_idはitem.rbで1の時に登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'condition_idはitem.rbで1の時に登録できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end

        it 'postage_payer_idはitem.rbで1の時に登録できないこと' do
          @item.postage_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
        end

        it 'prefecture_idはitem.rbで1の時に登録できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it 'handing_time_idはitem.rbで1の時に登録できないこと' do
          @item.handing_time_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Handing time must be other than 1')
        end

        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
