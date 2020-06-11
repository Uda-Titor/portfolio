require 'rails_helper'
RSpec.describe '案件周りの操作確認', type: :system do
  describe '案件一覧画面' do
    context '案件を作成した場合' do
      it '作成済みの案件が表示される' do
       new_matter = FactoryBot.create(:test1)
       visit matters_path
       expect(page).to have_content 'test1_title'
      end
    end
    context '検索をした場合' do
      before do
        FactoryBot.create(:test1)
        FactoryBot.create(:test2)
        FactoryBot.create(:test3)
      end
      it 'タイトルで検索できる' do
        visit matters_path
        fill_in 'タイトル',with: 'test1_title'
        click_on '検索する'
        expect(page).not_to have_content 'test2_title', 'test3_title'
      end
      it 'ステータスで検索できる' do
        visit matters_path
        select '未着手', from: 'ステータス'
        click_on '検索する'
        expect(page).not_to have_content 'test2_title', 'test3_title'
      end
      it '優先順位で並び替えができる' do
        visit matters_path
        click_on '優先順位'
        matter_list = all('#priority_row')
        expect(matter_list[0]).to have_content '高'
        expect(matter_list[1]).to have_content '中'
        expect(matter_list[2]).to have_content '低'
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
        matter = FactoryBot.create(:test1)
        visit matters_path
        click_on "Show"
        expect(page).to have_content 'test1_title'
      end
     end
  end
end
