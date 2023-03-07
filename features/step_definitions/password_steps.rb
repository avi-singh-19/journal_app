When(/^I fill in Email with 'test@email.com'$/) do
  fill_in("Email", :with => "test@email.com")
end

And(/^I fill in Password with 'pass'$/) do
  fill_in("Password", :with => "pass", wait: 2)
end

And(/^I fill in Confirmation with 'pass'$/) do
  fill_in("Password confirmation", :with => "pass")
end

And(/^I click the Sign Up button$/) do
  click_button("Sign Up")
end

Then(/^I should get a success alert$/) do
  text = find(:css, "div[role='alert']").text
  expect(text).to eq("Sign up successful")
end

When(/^I fill in Email with 'garbage_barge'$/) do
  fill_in("Email", :with => "garbage_barge")
end

Then(/^I should get an error that this is wrong$/) do
  text = find(:css, "div[role='alert']").text
  expect(text).to eq("Invalid details, please use a valid email and password")
end