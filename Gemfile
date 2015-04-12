source 'https://rubygems.org'

ruby '2.1.3'

gem 'rails',					'4.2.0.beta2'
gem 'bcrypt',					'3.1.7'
gem 'bootstrap-sass',			'3.2.0.0'
gem 'sass-rails',				'5.0.0.beta1'
gem 'uglifier',					'2.5.3'
gem 'coffee-rails',				'4.0.1'
gem 'jquery-rails',				'4.0.0.beta2'
gem 'turbolinks',				'2.3.0'
gem 'jbuilder',					'2.2.3'
gem 'rails-html-sanitizer',		'1.0.1'
gem 'sdoc',						'0.4.0', group: :doc
gem 'will_paginate-bootstrap'
gem 'will_paginate'
gem "twitter-bootstrap-rails"
gem 'bootstrap-datepicker-rails'
gem 'newrelic_rpm'
gem 'cocoon'
gem 'simple_form'
gem "paperclip", 				"~> 4.2"
gem 'bootstrap-datepicker-rails'
gem 'jquery-turbolinks'

group :development, :test do 
	gem 'sqlite3',				'1.3.9'
	gem 'byebug',				'3.4.0'
	gem 'web-console',			'2.0.0.beta3'
	gem 'spring',				'1.1.3'
	gem "nifty-generators"
end

group :test do
	gem 'minitest-reporters',	'1.0.5'
	gem 'mini_backtrace',		'0.1.3'
	gem 'guard-minitest', 		'2.3.1'
end

group :production do
	gem 'pg',					'0.17.1'
	gem 'rails_12factor',		'0.0.2'
	# gem 'unicorn',				'4.8.3'
	# gem 'passenger'
	gem 'puma'
end

# line of code removed from Procfile to test passenger -> web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
# for passenger -> web: bundle exec passenger start -p $PORT