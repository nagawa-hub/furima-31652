require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報のの保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end
    context '購入ができる時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@item_order).to be_valid
      end
      it '建物名が空でも購入できること' do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
    end

    context '購入ができない時' do
      it 'tokenが空だと購入できないこと' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号(post_number)が空だと購入できないこと' do
        @item_order.post_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号にハイフンがないと購入できないこと' do
        @item_order.post_number = '1231234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号が前３文字-後4文字でないと購入できないこと（前3文字未満）' do
        @item_order.post_number = '12-1234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号が前３文字-後4文字でないと購入できないこと（前3文字より多い）' do
        @item_order.post_number = '1234-1234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号が前３文字-後4文字でないと購入できないこと（後4文字未満）' do
        @item_order.post_number = '123-123'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号が前３文字-後4文字でないと購入できないこと（後4文字より多い）' do
        @item_order.post_number = '123-12345'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post number is invalid')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @item_order.home_prefecture_id = '1'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Home prefecture must be other than 1')
      end
      it '市区町村が空だと購入できないこと' do
        @item_order.home_town = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Home town can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @item_order.home_address = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Home address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12文字以上だと購入できないこと' do
        @item_order.phone_number = '1234123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号にハイフン(数字以外)が入っていると購入できないこと' do
        @item_order.phone_number = '123-123-123'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
