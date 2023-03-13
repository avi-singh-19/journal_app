Given(/^I am on the Login page$/) do
  visit "http://127.0.0.1:3000/login"
end

Then(/^I should see 'Login'$/) do
  page.title
  page.has_title? "Login"
end

And(/^I should get a login success alert$/) do
  text = find(:css, "div[role='alert']").text
  expect(text).to eq("Logged in successfully")
end

Given(/^I have logged in$/) do
  step %[I am on the Login page]
  step %[I fill in Email with 'test@email.com']
  step %[I fill in Password with 'pass']
  step %[I click the Sign In button]
  step %[I should get a login success alert]
end

And(/^I am on the Edit Password page$/) do
  visit "http://127.0.0.1:3000/password"
end

Then(/^I should get an updated password alert$/) do
  text = find(:css, "div[role='alert']").text
  expect(text).to eq("Password updated")
end

Then(/^I should get an error that passwords do not match$/) do
  text = find(:css, "div[role='alert']").text
  expect(text).to eq("Password and password confirmation do not match")
end

When(/^I click the 'Create an account' button$/) do
  find(:css, "button[class='btn btn-primary btn-lg']").click
end

When(/^I click the 'Already have a Journal account\? Click here to login' button$/) do
  click_button("Already have a Journal account? Click here to login")
end

When(/^I click the 'Don't have a Journal account\? Click here to sign up' button$/) do
  click_button("Don't have a Journal account? Click here to sign up")
end

And(/^I click the Update Password button$/) do
  click_button("Update Password")
end

And(/^I click the Sign In button$/) do
  click_button("Sign In")
end

When(/^I click the "([^"]*)" button$/) do |text|
  find_button("#{text}").click
end

When(/^I click 'Resume Journaling'$/) do
  click_button("Resume Journaling")
end