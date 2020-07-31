require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = build(:item)
    end
    context 'valid' do
      it 'is valid with a image, name, detail, category_id, condition_id, postage_payer_id, prefecture_id, shipping_day_id, price, user_id' do
        expect(@item).to be_valid
      end

      it 'is valid with price that less than 9999999' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end

      it 'is valid with price that more than 300' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid without a image' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'is invalid without a name' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a detail' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors[:introduction]).to include("can't be blank")
      end

      it 'is invalid without a category_id' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it 'is invalid without a condition_id' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

      it 'is invalid without a postage_payer_id' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors[:postage_payer_id]).to include("can't be blank")
      end

      it 'is invalid without a shipping_code_id' do
        @item.prefecture_code_id = nil
        @item.valid?
        expect(@item.errors[:shipping_code_id]).to include("can't be blank")
      end

      it 'is invalid without a preparation_day_id' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors[:preparation_day_id]).to include("can't be blank")
      end

      it 'is invalid without a price' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it 'is invalid price is too much maximum 9999999' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('is not included in the list')
      end

      it 'is invalid with a that has less than 300' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('is not included in the list')
      end
    end
  end
end