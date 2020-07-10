require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'バリデーション' do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:test1)
    end
    it '有効な状態であること' do
      comment = FactoryBot.build(:comment)
      expect(comment).to be_valid
    end
    it 'contentがnilであると無効な状態であること' do
      comment = FactoryBot.build(:comment, content: nil)
      expect(comment).not_to be_valid
    end
    it 'matter_idがnilであると無効な状態であること' do
      comment = FactoryBot.build(:comment, matter_id: nil)
      expect(comment).not_to be_valid
    end
    it 'user_idがnilであると無効な状態であること' do
      comment = FactoryBot.build(:comment, user_id: nil)
      expect(comment).not_to be_valid
    end
  end
end
