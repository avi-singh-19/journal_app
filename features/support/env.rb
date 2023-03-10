require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'active_support/testing/time_helpers'
# require 'cucumber/rails'
# require 'dotenv/load'

Capybara.server = :puma

Capybara.register_driver(:chrome_headless) do |app|
  args = %w[disable-gpu no-sandbox]
  args << 'headless' unless ENV['SHOW_BROWSER']

  options = Selenium::WebDriver::Chrome::Options.new(args: args)

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :chrome_headless
