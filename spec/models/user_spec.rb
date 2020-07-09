require 'rails_helper'

RSpec.describe User, type: :model do
  context "バリデーション" do
    it "有効な状態であること" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    it "nameがなければ無効" do
      user = FactoryBot.build(:user, name: nil)
      expect(user).not_to be_valid
    end
    it "emailがなければ無効" do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end
    it "同じnameにすると無効" do
      FactoryBot.create(:user)
      user = FactoryBot.build(:admin, name: 'user')
      expect(user).not_to be_valid
    end
    it "nameを20文字以上にすると無効" do
      user = FactoryBot.build(:admin, name: "a"*25)
      expect(user).not_to be_valid
    end
    it "同じemailsにすると無効" do
      FactoryBot.create(:user)
      user = FactoryBot.build(:admin, email: "user@example.com")
      expect(user).not_to be_valid
    end
    it "パスワードを６字以下にすると無効" do
      user = FactoryBot.build(:user, password: "000")
      expect(user).not_to be_valid
    end
  end
end
