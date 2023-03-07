include ActiveSupport::Testing::TimeHelpers
require 'active_support/testing/time_helpers'

Given(/^I am on the journal home page$/) do
  visit "http://127.0.0.1:3000"
end

When(/^I click Home$/) do
  find(:css, ".navbar-brand").click
end

Then(/^I should see 'Welcome to Journal'$/) do
  page.title
  page.has_title? "Welcome to Journal"
end

Given(/^I am on the About page$/) do
  visit "http://127.0.0.1:3000/about"
end

Then(/^I should see 'About Journal'$/) do
  page.title
  page.has_title? "About Journal"
end

Given(/^I am on the Sign Up page$/) do
  visit "http://127.0.0.1:3000/sign-up"
end

Then(/^I should see 'Sign Up'$/) do
  page.title
  page.has_title? "Sign Up"
end

When(/^I have been inactive for (\d+) seconds$/) do |arg|
  travel_to(Time.now + arg)
end