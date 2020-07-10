require 'rails_helper'

RSpec.describe Notification, type: :model do
  context 'バリデーション' do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:admin)
      FactoryBot.create(:test1)
      FactoryBot.create(:comment)
    end
    it '有効な状態であること' do
      notification = Notification.new(visitor_id: 1, visited_id: 2, matter_id: 1, comment_id: 1, action: 'comment', checked: true, admin_checked: true)
      expect(notification).to be_valid
    end
    it 'visitor_idがnilならば無効な状態であること' do
      notification = Notification.new(visitor_id: nil, visited_id: 2, matter_id: 1, comment_id: 1, action: 'comment', checked: true, admin_checked: true)
      expect(notification).not_to be_valid
    end
    it 'visited_idがnilならば無効な状態であること' do
      notification = Notification.new(visitor_id: 1, visited_id: nil, matter_id: 1, comment_id: 1, action: 'comment', checked: true, admin_checked: true)
      expect(notification).not_to be_valid
    end
    it 'matter_idがnilならば無効な状態であること' do
      notification = Notification.new(visitor_id: 1, visited_id: 2, matter_id: nil, comment_id: 1, action: 'comment', checked: true, admin_checked: true)
      expect(notification).not_to be_valid
    end
    it 'actionがnilならば無効な状態であること' do
      notification = Notification.new(visitor_id: 1, visited_id: nil, matter_id: 1, comment_id: 1, action: nil, checked: true, admin_checked: true)
      expect(notification).not_to be_valid
    end
    it 'checkedがnilならば無効な状態であること' do
      notification = Notification.new(visitor_id: 1, visited_id: nil, matter_id: 1, comment_id: 1, action: nil, checked: nil, admin_checked: true)
      expect(notification).not_to be_valid
    end
    it 'admin_checkedがnilならば無効な状態であること' do
      notification = Notification.new(visitor_id: 1, visited_id: nil, matter_id: 1, comment_id: 1, action: nil, checked: nil, admin_checked: nil)
      expect(notification).not_to be_valid
    end
  end
end
