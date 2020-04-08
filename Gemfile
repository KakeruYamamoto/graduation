# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Core
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails', '~> 5.2.4'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'

# Frontend
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'kaminari-bootstrap'
gem 'rails-i18n'
gem 'redcarpet'
gem 'rouge'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

# Backend
gem 'cancancan'
gem 'carrierwave'
gem 'faker'
gem 'gimei'
gem 'kaminari'
gem 'mini_magick'
gem 'rails_admin'
gem 'ransack'
# gem 'seed-fu', '~> 2.3'
# gem 'slim-rails'
# gem 'html2slim'

# Authentication
gem 'devise'

# AWS
gem 'fog-aws'

# Server
gem 'dotenv-rails'
gem 'mini_racer', platforms: :ruby
gem 'unicorn'

# Login
gem 'omniauth'
gem 'omniauth-google-oauth2'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'gimei'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'selenium-webdriver'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'webdrivers'
end

group :development do
  gem 'bcrypt_pbkdf'
  gem 'ed25519'
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'chromedriver-helper'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
