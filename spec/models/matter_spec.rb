require 'rails_helper'

RSpec.describe Matter, type: :model do
  before do
    FactoryBot.create(:user)
  end
  context "バリデーション" do
    it "有効な状態であること" do
      matter = FactoryBot.build(:test1, user_id: 1)
      expect(matter).to be_valid
    end
    it "titleがなければ無効" do
      matter = FactoryBot.build(:test1, title: nil,  user_id: 1)
      expect(matter).not_to be_valid
    end
    it "titleがなければ無効" do
      matter = FactoryBot.build(:test1, content: nil,  user_id: 1)
      expect(matter).not_to be_valid
    end
    it "user_idがなければ無効" do
      matter = FactoryBot.build(:test1, content: nil,  user_id: 1)
      expect(matter).not_to be_valid
    end
  end
end
