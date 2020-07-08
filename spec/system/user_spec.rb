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
        expect(page).to have_content 'アカウント登録が完了しました。'
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
      it 'ユーザー新規登録時にメールがすでに登録してあるとエラーが出る' do
        FactoryBot.create(:user)
        sleep 0.5
        visit new_user_registration_path
        fill_in 'user', with: 'user'
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: '00000000'
        fill_in 'password_confirmation', with: '00000000'
        click_on 'sign_up'
        expect(page).to have_content 'メールはすでに存在します'
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
        expect(page).to have_content 'ログインしました。'
      end
      it 'ユーザログイン後、ログアウトできる' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'ログアウト'
        expect(current_path).to eq new_user_session_path
      end
      it 'ユーザログインするとき、メールを空欄にしたらエラーがでる' do
        visit new_user_session_path
        fill_in 'メール', with: ''
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        expect(page).to have_content 'メールまたはパスワードが違います。'
      end
      it 'ユーザログインするとき、パスワードを空欄にしたらエラーがでる' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: ''
        click_on 'log_in'
        expect(page).to have_content 'メールまたはパスワードが違います。'
      end
      it 'ログインして、ユーザの詳細を確認後、ユーザー名編集できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'user'
        find(:xpath, '/html/body/div[1]/div[1]/span/a/i').click
        fill_in 'user', with: 'sample'
        click_on 'update'
        expect(page).to have_content 'sample'
      end
      it 'ログインして、ユーザの詳細を確認後、パスワードを編集できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'user'
        find(:xpath, '/html/body/div[1]/div[1]/span/a/i').click
        fill_in 'password', with: '09090909'
        fill_in 'password_confirmation', with: '09090909'
        click_on 'update'
        click_on 'ログアウト'
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '09090909'
        click_on 'log_in'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインして、ユーザの詳細を確認後、アカウントを削除できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'user'
        find(:xpath, '/html/body/div[1]/div[1]/span/a/i').click
        click_on 'user_delete'
        sleep 0.5
        page.accept_confirm '本当によろしいですか?'
        sleep 0.5
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '09090909'
        click_on 'log_in'
        expect(page).to have_content 'メールまたはパスワードが違います。'
      end
    end
  end
  describe 'プロフィール編集ページ' do
    context 'ページレイアウト' do
      before do
        FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on 'user'
      end
      it 'ユーザーの名前が表示される' do
        expect(page).to have_content 'user'
      end
      it 'ユーザーのメールが表示される' do
        expect(page).to have_content 'user@example.com'
      end
      it 'ユーザーの電話番号が表示される' do
        expect(page).to have_content '090-0909-0909'
      end
      it 'ユーザーの住所が表示される' do
        expect(page).to have_content 'ユーザーの住所'
      end
      it '備考が表示される' do
        expect(page).to have_content '備考です'
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
      it '一般ユーザーはユーザー一覧に入れない' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        visit admin_users_path
        expect(page).to have_content '勤務時間は平日の8時半〜１７時までです。'
      end
      it '一般ユーザーには管理者画面へのリンクが表示されない' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        expect(page).to_not have_content '管理者画面'
      end
      it '一般ユーザーにはユーザー一覧へのリンクが表示されない' do
        visit new_user_session_path
        fill_in 'メール', with: 'user@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        expect(page).to_not have_content 'ユーザー覧'
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
      it 'ログインして、管理者画面に移り、ラベルを作成できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on '管理者画面'
        click_on 'ラベル'
        fill_in 'label_form', with: '道路'
        click_on '登録する'
        expect(page).to have_content '道路'
      end
      it 'ログインして、管理者画面に移り、ラベルを作成後、削除できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        click_on '管理者画面'
        click_on 'ラベル'
        fill_in 'label_form', with: '道路'
        click_on '登録する'
        find('.fa-trash-alt').click
        page.accept_confirm '本当に削除しますか?'
        expect(page).to_not have_content '道路'
      end
      it 'ログインして、お知らせを追加できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        binding.irb
        find('.information').click
        fill_in 'information_content', with: '今日は大変忙しいです'
        click_on '追加する'
        expect(page).to_not have_content '今日は大変忙しいです'
      end
      it 'ログインして、お知らせを追加後、編集できる' do
        visit new_user_session_path
        fill_in 'メール', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'log_in'
        binding.irb
        find('.information').click
        fill_in 'information_content', with: '今日は大変忙しいです'
        click_on '追加する'
        find('.fas fa-edit').click
        expect(page).to_not have_content '今日は大変忙しいです'
      end
    end
  end
end
