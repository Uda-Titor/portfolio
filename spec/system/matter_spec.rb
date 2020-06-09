require 'rails_helper'
RSpec.describe 'ここ危険！', type: :system do
  describe '案件一覧画面' do
    context '案件を作成した場合' do
      it '作成済みの案件が表示される' do
      matter = create(:matter)
      visit matters_path
      expect(page).to have_content 'test_title'
     end
    end
  end
  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される'

    end
  end
  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移する'
     end
  end
end
