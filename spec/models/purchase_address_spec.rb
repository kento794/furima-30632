require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user) 
      item = FactoryBot.create(:item) 
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end 
      
      describe '商品購入の保存' do
        context '商品が購入できて保存できるとき' do
          it 'post_code、prefecture_id、city、address、phone_number、user_id、item_id、token、が存在すれば保存できること' do
            expect(@purchase_address).to be_valid
          end

          it ' 郵便番号にハイフンがあれば保存できること' do
            @purchase_address.post_code = '123-4567'
            expect(@purchase_address).to be_valid
          end

          it ' 電話番号にはハイフンは不要で、11桁以内あれば保存できること' do
            @purchase_address.phone_number = '19012345678'
            expect(@purchase_address).to be_valid
          end
        end

        
        context '商品が購入できず保存できないとき' do
          it 'post_codeが空では登録できないこと' do
            @purchase_address.post_code = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
          end

          it 'prefecture_idが空では登録できないこと' do
            @purchase_address.prefecture_id = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
          end

          it 'cityが空では登録できないこと' do
            @purchase_address.city = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("City can't be blank")
          end

          it 'addressが空では登録できないこと' do
            @purchase_address.address = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
          end

          it 'phone_numberが空では登録できないこと' do
            @purchase_address.phone_number = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
          end
      
          it 'user_idが空では登録できないこと' do
            @purchase_address.user_id = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("User can't be blank")
          end


          it 'item_idが空では登録できないこと' do
              @purchase_address.item_id = nil
              @purchase_address.valid?
              expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
          end

          it 'tokenが空では登録できないこと' do
            @purchase_address.token = nil
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
          end

          it 'prefecture_idはitem.rbで1の時に登録できないこと' do
            @purchase_address.prefecture_id = 1
            @purchase_address.valid?
            expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
          end

         
        end
    end
  end
end
