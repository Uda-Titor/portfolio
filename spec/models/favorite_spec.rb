require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:admin)
    FactoryBot.create(:test1)
  end
  context 'バリデーション' do
    it '有効な状態であること' do
      favorite = Favorite.new(matter_id: 1, user_id: 2)
      expect(favorite).to be_valid
    end
    it 'matter_idがnilである場合、無効な状態であること' do
      favorite = Favorite.new(matter_id: nil, user_id: 2)
      expect(favorite).to_not be_valid
    end
    it 'user_idがnilである場合、無効な状態であること' do
      favorite = Favorite.new(matter_id: nil, user_id: nil)
      expect(favorite).to_not be_valid
    end
  end
end
