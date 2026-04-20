source "https://rubygems.org"

ruby "3.2.0"

gem "rails", "~> 7.1.0"
gem "sprockets-rails"

# 開発環境（自分のPC）では mysql2 を使う
group :development, :test do
  gem "mysql2", "~> 0.5"
end

# 本番環境（Render）では PostgreSQL を使う
group :production do
  gem "pg"
end

gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'pry-rails'      # ← ここに追加！
  gem 'pry-byebug'     # ← これも一緒に入れておくと、デバッグがより便利になります
  gem 'rspec-rails', '~> 6.0.0'
  gem 'factory_bot_rails'
  gem 'faker'          # テスト用のランダムデータ生成用
end

group :development do
  gem "web-console"
  gem 'rubocop', '1.71.2', require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem 'devise'