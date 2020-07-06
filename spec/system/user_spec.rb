require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータがなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user', with: 'user'
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: '00000000'
        fill_in 'password_confirmation', with: '00000000'
        click_on 'sign_up'
        expect(page).to have_content 'お知らせ'
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit matters_path
        expect(current_path).to eq new_user_session_path
      end
      it 'ユーザー新規登録時に名前が空白だとエラーが出る' do
        visit new_user_registration_path
        fill_in 'user', with: ''
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: '00000000'
        fill_in 'password_confirmation', with: '00000000'
        click_on 'sign_up'
        expect(page).to have_content '名前を入力してください'
      end
      it 'ユーザー新規登録時にメールが空白だとエラーが出る' do
        visit new_user_registration_path
        fill_in 'user', with: 'user'
        fill_in 'email', with: ''
        fill_in 'password', with: '00000000'
        fill_in 'password_confirmation', with: '00000000'
        click_on 'sign_up'
        expect(page).to have_content 'メールを入力してください'
      end
      it 'ユーザー新規登録時にパスワードが空白だとエラーが出る' do
        visit new_user_registration_path
        fill_in 'user', with: 'user'
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: ''
        fill_in 'password_confirmation', with: '00000000'
        click_on 'sign_up'
        expect(page).to have_content 'パスワードを入力してください'
      end
      it 'ユーザー新規登録時にパスワード（確認)が空白だとエラーが出る' do
        visit new_user_registration_path
        fill_in 'user', with: 'user'
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: '00000000'
        fill_in 'password_confirmation', with: ''
        click_on 'sign_up'
        expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
      end
    end
  end
  describe 'ユーザのログインテスト' do
    context 'ユーザのデータがすでにありログインしていない場合' do
      before do
        FactoryBot.create(:user)
      end
      it 'ユーザログインのテスト' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        expect(page).to have_content 'お知らせ'
      end
      it 'ログインして、ユーザの詳細を確認' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'user'
        expect(page).to have_content 'user@example.com'
      end
      it 'ログインして、ユーザの詳細を確認後、編集できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'user'
        find(:xpath, '/html/body/div[1]/div[1]/span/a/i').click
        fill_in 'user', with: '1'
        click_on 'update'
        expect(page).to have_content '1'
      end
    end
  end
  describe '管理者の管理機能' do
    context '管理者のデータがすでにありログインしていない場合' do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:admin)
      end
      it '一般ユーザーは管理者画面に入れない' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        visit admin_matters_path
        expect(page).to have_content 'user'
      end
      it '管理者は管理者画面に入り、他のユーザを編集できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'ユーザ一覧'
        find(:xpath, '/html/body/div/div/div[1]/div[1]/span[2]').click
        fill_in 'user', with: 'sample'
        click_on '更新する'
        expect(page).to have_content 'sample'
      end
      it 'ログインして、ユーザの詳細を確認後、編集できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'ユーザ一覧'
        find(:xpath, '/html/body/div/div/div[1]/div[1]/span[1]/a/i').click
        sleep 0.5
        page.accept_confirm 'Are you sure?'
        sleep 0.5
        expect(User.count).to eq(1)
      end
    end
  end
end
