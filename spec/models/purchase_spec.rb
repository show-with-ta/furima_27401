require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    before do
      @purchase = build(:purchase)
    end

    context 'valid' do
      it 'is valid with a post_code, prefecture_id, city, street_number, phone_number, item_id' do
        expect(@purchase).to be_valid
      end

      it 'is valid building is nil' do
        @purchase.building = nil
        expect(@purchase).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid without a post_code' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors[:post_code]).to include("can't be blank")
      end

      it 'is invalid without a no hyphen on post_code' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors[:post_code]).to include('郵便番号にはハイフンが必要です。')
      end

      it 'is invalid without a prefecture_id' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'is invalid prefecture_id is 1' do
        @purchase.prefecture_id = '1'
        @purchase.valid?
        expect(@purchase.errors[:prefecture_id]).to include('must be other than 1')
      
      it 'is invalid without a city' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors[:city]).to include("can't be blank")
      end
      
      it 'is invalid without a street_number' do
        @purchase.street_number = nil
        @purchase.valid?
        expect(@purchase.errors[:street_number]).to include("can't be blank")
      end
      
      it 'is invalid without a phone_number' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors[:phone_number]).to include("can't be blank")
      end
      
      it 'is invalid with phone_number on hyphen' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors[:phone_number]).to include('電話番号にはハイフンは不要で11桁以内です。')
      end
    end
  end
end