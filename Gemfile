source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'dotenv-rails'
gem 'mini_racer', platforms: :ruby # デプロイ時に必要
gem 'unicorn' # アプリケーションサーバのunicorn
# バッヂ処理
gem 'whenever', require: false
# rubcop
gem 'rubocop'
gem 'rubocop-rails', require: false
# ページネーション
gem 'kaminari'
# アイコンデフォルト
gem 'font-awesome-sass', '~> 5.4.1'
# カレンダー
gem 'simple_calendar', '~> 2.0'
# グラフ
gem 'chartkick'
gem 'groupdate'
# 画像アップロード
gem 'aws-sdk-s3', require: false
gem 'carrierwave'
gem 'mini_magick'
# userログイン機能
gem 'devise'
gem 'devise-i18n'
# 検索gem
gem 'ransack'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # デバック関連
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  # テスト関連
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'spring'
  #wheneverテスト
  gem "shoulda-whenever"
  gem "whenever-test"

  gem 'capistrano', '3.6.0' # capistranoのツール一式
  gem 'capistrano3-unicorn'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring'
  gem 'bcrypt_pbkdf'
  gem 'ed25519'
  gem 'letter_opener_web'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
