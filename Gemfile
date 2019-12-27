# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'active_model_serializers', '~> 0.10.2'
gem 'faker'
gem 'puma', '~> 3.11'
gem 'solargraph'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'cpf_faker'
gem 'devise_token_auth'
gem 'devise'
gem 'rack-cors'
gem 'simple_token_authentication', '~> 1.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'ffaker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
