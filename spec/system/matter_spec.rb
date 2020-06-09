require 'rails_helper'
RSpec.describe 'ここ危険！', type: :system do
  describe '案件一覧画面' do
    context '案件を作成した場合' do
      it '作成済みの案件が表示される' do
      matter = FactoryBot.create(:matter)
      visit matters_path
      expect(page).to have_content 'test_title'
     end
    end
  end
  describe '案件登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存される' do
        visit matters_path
        click_on 'New Matter'
        fill_in 'Title', with: 'test_title'
        fill_in 'Content', with: 'test_content'
        click_button '登録する'
        expect(page).to have_content 'test_title'
      end
    end
  end
  describe '案件詳細画面' do
     context '任意の案件詳細画面に遷移した場合' do
       it '該当案件の内容が表示されたページに遷移する' do
        matter = FactoryBot.create(:matter)
        visit matters_path
        click_on "Show"
        expect(page).to have_content 'test_title'
      end
     end
  end
end
