require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータがなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'Name', with: 'sample'
        fill_in 'Email', with: 'sample@example.com'
        fill_in 'Password', with: '00000000'
        fill_in 'Password confirmation', with: '00000000'
        click_on 'Sign up'
        expect(page).to have_content 'Matters'
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit matters_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end
  describe 'ユーザのログインテスト' do
    context 'ユーザのデータがすでにありログインしていない場合' do
      before do
        FactoryBot.create(:sample)
      end
      it 'ユーザログインのテスト' do
        visit new_user_session_path
        fill_in 'Email', with: 'sample@example.com'
        fill_in 'Password', with: '00000000'
        click_on 'Log in'
        expect(page).to have_content 'Matters'
      end
      it 'ログインして、ユーザの詳細を確認' do
        visit new_user_session_path
        fill_in 'Email', with: 'sample@example.com'
        fill_in 'Password', with: '00000000'
        click_on 'Log in'
        click_on 'sample'
        expect(page).to have_content 'sample@example.com'
      end
      it 'ログインして、ユーザの詳細を確認後、編集できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'sample@example.com'
        fill_in 'Password', with: '00000000'
        click_on 'Log in'
        click_on 'sample'
        click_on "編集する"
        fill_in 'Name', with: '1'
        click_on 'Update'
        expect(page).to have_content '1'
      end
    end
  end
  describe '管理者の管理機能' do
    context '管理者のデータがすでにありログインしていない場合' do
      before do
        FactoryBot.create(:sample)
        FactoryBot.create(:admin)
      end
      it '一般ユーザーは管理者画面に入れない' do
        visit new_user_session_path
        fill_in 'Email', with: 'sample@example.com'
        fill_in 'Password', with: '00000000'
        click_on 'Log in'
        visit admin_matters_path
        expect(page).to have_content 'sample'
      end
      it '管理者は管理者画面に入り、他のユーザを編集できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'admin@example.com'
        fill_in 'Password', with: '00000000'
        click_on 'Log in'
        click_on 'ユーザ一覧'
        find(:xpath, '/html/body/a[2]').click
        fill_in 'Name', with: 'user'
        click_on '更新する'
        expect(page).to have_content 'user'
      end
      it 'ログインして、ユーザの詳細を確認後、編集できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'admin@example.com'
        fill_in 'Password', with: '00000000'
        click_on 'Log in'
        click_on 'ユーザ一覧'
        find(:xpath, '/html/body/a[3]').click
        sleep 0.5
        page.accept_confirm 'Are you sure?'
        sleep 0.5
        expect(User.count).to eq(1)
      end
    end
  end
end
