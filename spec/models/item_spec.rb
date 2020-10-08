require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('suz.jpg')
    end
    it '全ての値が存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では登録できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'categoryが選択されていないと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'conditionが選択されていないと登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it 'postageが選択されていないと登録できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage must be other than 1')
    end

    it 'shipment_sourceが選択されていないと登録できない' do
      @item.shipment_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
    end

    it 'shipment_dayが選択されていないと登録できない' do
      @item.shipment_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment day must be other than 1')
    end

    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceの値が300より小さいと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceの値が9,999,999より大きいと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceの値が半角数字ではない場合、登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
