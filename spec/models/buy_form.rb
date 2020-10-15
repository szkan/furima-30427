require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  describe '商品購入機能' do
    before do
      @buy_form = FactoryBot.build(:buy_form)
    end

    it '全ての値が存在すれば購入できる' do
      expect(@buy_form).to be_valid
    end
    it 'building_nameが空でも購入できる' do
      @buy_form.building_name = nil
      expect(@buy_form).to be_valid
    end

    it 'tokenが空だと購入出来ない' do
      @buy_form.token = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空だと購入出来ない' do
      @buy_form.post_code = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと購入出来ない' do
      @buy_form.post_code = 1234567
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Post code is invalid")
    end

    it 'prefecture_idが選択されていないと購入出来ない' do
      @buy_form.prefecture_id = 1
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'cityが空だと購入出来ない' do
      @buy_form.city = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと購入出来ない' do
      @buy_form.address = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと購入出来ない' do
      @buy_form.phone_number = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字以外だと購入できない' do
      @buy_form.phone_number = "１２３４５６７８９"
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが９桁以下だと購入できない' do
      @buy_form.phone_number = 123456789
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが１２桁以上だと購入できない' do
      @buy_form.phone_number = 123456789112
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
