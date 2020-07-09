require 'rails_helper'

RSpec.describe Matter, type: :model do
  let!(:matter) { create(:matter) }

  it "has a valid factory of user" do
    expect(matter).to be_valid
  end
  it "has a valid factory of another_user" do
    comment = build(:comment, )
    expect(user).to be_valid
  end

  it "is valid with title, content and user_id" do
    user = @user
    matter = user.matters.build(
      title: "test",
      content: "test_content",
      user_id: 1
      )
    expect(matter).to be_valid
  end
  it "is invalid without title" do
    matter = Matter.new(title: nil)
    matter.valid?
    expect(matter.errors[:title]).to include("を入力してください")
  end
end
