source 'https://rubygems.org'
ruby "2.2.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

#Creates soft deletion, so we don't break any relations when deleting old records
gem "paranoia", "~> 2.0"

gem "httparty"

#File management
gem 'paperclip'
gem 'aws-sdk', '< 2.0'

#PaperTrail to track any changes on tables
gem 'paper_trail', '~> 3.0.1'

#User Roles
gem "rolify"

#Excel handling (import only)
gem 'roo', '1.13.2'

#Excel handling (export only)
gem 'axlsx_rails', '~> 0.3.0'
gem 'rubyzip', '~> 1.0.0'

#PDF Generation
# gem 'wicked_pdf'
# gem 'wkhtmltopdf-binary'

#Pagination
gem "will_paginate"

#HTML Mask for numbers
gem 'autonumeric-rails'

#Authorization Control
gem "cancancan"

#Easy forms
# gem 'simple_form', '~> 3.1.0.rc1'
gem 'formtastic'

#Authentication Control
gem 'devise'

#Full text search
gem 'pg_search'

gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x' # For 4.x
gem 'devise-i18n-views'

#choosing where to display validation error message
gem 'dynamic_form'

group :production do
  gem 'pg'
  gem 'thin'
  gem 'taps'
  gem 'rvm'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
