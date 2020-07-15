require 'rails_helper'
RSpec.describe '案件周りの操作確認', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:admin)
    visit new_user_session_path
    fill_in 'メール', with: 'user@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'log_in'
  end
  describe '案件一覧画面' do
    context '案件を作成した場合' do
      it '作成済みの案件が表示される' do
        new_matter = FactoryBot.create(:test1, user_id: 1)
        visit matters_path
        expect(page).to have_content 'test1_title'
      end
    end
    context '検索をした場合' do
      before do
        FactoryBot.create(:test1, user_id: 1)
        FactoryBot.create(:test2, user_id: 2)
        FactoryBot.create(:test3, user_id: 2)
      end
      it 'タイトルで検索できる' do
        visit matters_path
        fill_in 'タイトル', with: 'test1_title'
        click_on '検索する'
        expect(page).not_to have_content 'test2_title'
      end
      it 'ユーザー名で検索できる' do
        visit matters_path
        fill_in 'ユーザー名', with: 'user'
        click_on '検索する'
        expect(page).not_to have_content 'test2_title'
      end
      it 'ステータスで検索できる' do
        visit matters_path
        select '未着手', from: 'ステータス'
        click_on '検索する'
        expect(page).not_to have_content 'test2_title'
      end
      it '優先順位で並び替えができる' do
        visit matters_path
        click_on '優先順位'
        sleep 0.5
        matter_list = all('#priority_row')
        sleep 0.5
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
        click_on 'new'
        fill_in 'タイトル', with: 'test_title'
        fill_in '要望内容', with: 'test_content'
        click_button '登録する'
        expect(page).to have_content 'test_title'
      end
      it 'タイトルを入れないとエラーが出る' do
        visit matters_path
        click_on 'new'
        fill_in 'タイトル', with: ''
        fill_in '要望内容', with: 'test_content'
        click_button '登録する'
        expect(page).to have_content 'タイトルを入力してください'
      end
      it '要望内容を入れないとエラーが出る' do
        visit matters_path
        click_on 'new'
        fill_in 'タイトル', with: 'test_title'
        fill_in '要望内容', with: ''
        click_button '登録する'
        expect(page).to have_content '要望内容を入力してください'
      end
    end
  end
  describe '案件詳細画面' do
    context '任意の案件詳細画面に遷移した場合' do
      it '該当案件の内容が表示されたページに遷移する' do
        FactoryBot.create(:test1, user_id: 1)
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        expect(page).to have_content 'test1_title'
      end
    end
    context '任意の案件詳細画面に遷移した場合' do
      it '該当案件にいいねができる' do
        matter = FactoryBot.create(:test1, user_id: 2)
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find('.fa-thumbs-up').click
        sleep 0.5
        expect(page).to have_css "div#favorites_buttons_#{matter.id} ", text: '1'
      end
    end
    context '任意の案件詳細画面に遷移した場合' do
      it '該当案件にいいねを外すことができる' do
        matter = FactoryBot.create(:test1, user_id: 2)
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find('.fa-thumbs-up').click
        find('.fa-thumbs-up').click
        sleep 0.5
        expect(page).to have_css "div#favorites_buttons_#{matter.id}", text: '0'
      end
    end
    context '任意の案件詳細画面に遷移した場合' do
      it 'コメントができる' do
        FactoryBot.create(:test1, user_id: 2)
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find(:xpath, '/html/body/div/span/button').click
        fill_in 'comment', with: 'さすがです'
        click_on 'コメントする'
        expect(page).to have_content 'さすがです'
      end
    end
    context '任意の案件詳細画面に遷移した場合' do
      it 'コメント後、コメントを削除できる' do
        FactoryBot.create(:test1, user_id: 2)
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find(:xpath, '/html/body/div/span/button').click
        fill_in 'comment', with: 'さすがです'
        click_on 'コメントする'
        sleep 0.5
        find('.fa-trash-alt').click
        page.accept_confirm '本当に削除しますか?'
        expect(page).not_to have_content 'さすがです'
      end
      context 'ページレイアウト' do
        before do
          FactoryBot.create(:test1, user_id: 2)
          visit matters_path
          find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        end
        it '案件のタイトルが表示される' do
          expect(page).to have_content 'test1_title'
        end
        it '案件内容が表示される' do
          expect(page).to have_content 'test1_content'
        end
        it '案件の進捗状況が表示される' do
          expect(page).to have_content '未着手'
        end
        it '要望箇所が表示される' do
          expect(page).to have_content 'test_address'
        end
        it '緯度が表示される' do
          expect(page).to have_content 'test_address'
        end
        it '経度が表示される' do
          expect(page).to have_content 111
        end
        it '緊急度が表示される' do
          expect(page).to have_content 112
        end
      end
    end
    context '任意の案件詳細画面に遷移した場合' do
      it 'コメント後、コメントを編集できる' do
        matter = FactoryBot.create(:test1, user_id: 2)
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find(:xpath, '/html/body/div/span/button').click
        fill_in 'comment', with: 'さすがです'
        click_on 'コメントする'
        find('.fa-edit').click
        fill_in "comment_content_#{matter.id}", with: 'すばらしいです'
        click_on '変更する'
        expect(page).to have_content 'すばらしいです'
      end
    end
  end
  describe '通知' do
    context 'userデータがあり、案件が１つ作成されている場合' do
      before do
        FactoryBot.create(:test1, user_id: 2)
        visit matters_path
      end
      it 'いいねをしたら、通知される' do
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find('.fa-thumbs-up').click
        visit matters_path
        click_on 'ログアウト'
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on '通知'
        expect(Notification.count).to eq 1
      end
      it 'コメントをしたら、通知される' do
        visit matters_path
        find(:xpath, '/html/body/div[1]/div[4]/div[2]/table/tbody/tr/td[8]/a').click
        find(:xpath, '/html/body/div/span/button').click
        fill_in 'comment', with: 'さすがです'
        click_on 'コメントする'
        click_on 'ログアウト'
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on '通知'
        expect(Notification.count).to eq 1
      end
    end
  end
end
