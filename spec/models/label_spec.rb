require 'rails_helper'

RSpec.describe Label, type: :model do
  context "バリデーション" do
    it "有効な状態であること" do
      label = Label.new(name: '道路')
      expect(label).to be_valid
    end
    it "nameがnilの場合、無効な状態であること" do
      label = Label.new(name: nil)
      expect(label).not_to be_valid
    end
    it "nameが同じ場合、無効な状態であること" do
      Label.create(id: 1, name: '道路')
      label = Label.new(name: '道路')
      expect(label).not_to be_valid
    end
    it "nameが10文字以上の場合、無効な状態であること" do
      label = Label.new(name: '道路'*15)
      expect(label).not_to be_valid
    end
  end
end
