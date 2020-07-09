require 'rails_helper'

RSpec.describe Labelling, type: :model do
  before do
    Label.create(id: 1, name: '道路')
    FactoryBot.create(:user)
    FactoryBot.create(:test1)
  end
  context "バリデーション" do
    it "有効な状態であること" do
      labelling = Labelling.new(matter_id: 1, label_id: 1)
      expect(labelling).to be_valid
    end
    it "matter_idがnilならば、無効な状態であること" do
      labelling = Labelling.new(matter_id: nil, label_id: 1)
      expect(labelling).not_to be_valid
    end
    it "label_idがnilならば、無効な状態であること" do
      labelling = Labelling.new(matter_id: 1, label_id: nil)
      expect(labelling).not_to be_valid
    end
  end
end
