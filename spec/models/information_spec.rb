require 'rails_helper'

RSpec.describe Information, type: :model do
  context "バリデーション" do
    it "有効な状態であること" do
      information = Information.new(content: "今日はいい天気です")
      expect(information).to be_valid
    end
    it "contentがnilの時、無効な状態であること" do
      information = Information.new(content: nil)
      expect(information).not_to be_valid
    end
  end
end
