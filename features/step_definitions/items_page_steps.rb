When(/^I try and manually access the 'Items' page$/) do
  visit "http://127.0.0.1:3000/items"
end

Then(/^I should get an error that I cannot access that page$/) do
  text = find(:css, "div[role='alert']").text
  expect(text).to eq("Please log in to access that.")
end

When(/^I am on the Items page$/) do
  visit "http://127.0.0.1:3000/items"
end

Then(/^I should see 'Items'$/) do
  page.title
  page.has_title? "Items"
end

Given(/^I have logged in and I am on 'Items'$/) do
  step %[I have logged in]
  step %[I am on the Items page]
end

When(/^I click the 'New item' button$/) do
  click_on("New item")
end

Then(/^I should see 'New item'$/) do
  page.title
  page.has_title? "New item"
end

Given(/^I am on the 'New item' page$/) do
  step %[I have logged in and I am on 'Items']
  step %[I click the 'New item' button]
end

When(/^I click Save$/) do
  click_button("Save")
end

When(/^I fill in Name with 'Test Entry'$/) do
  fill_in("Name", :with => "Test Entry")
end

And(/^I fill in Description with 'This is a test entry'$/) do
  fill_in("Description", :with => "This is a test entry")
end

Given(/^I have created an item$/) do
  step %[I am on the 'New item' page]
  step %[I fill in Name with 'Test Entry']
  step %[I fill in Description with 'This is a test entry']
  step %[I click Save]
end

When(/^I click the Edit button$/) do
  within(:css, "td[class='hstack gap-1']") do
    find(".btn.btn-success").click
  end
end

Then(/^I should see 'Editing item'$/) do
  page.title
  page.has_title? "Editing item"
end

And(/^I fill in Name with 'Edited new item'$/) do
  fill_in("Name", :with => "Edited new item")
end

And(/^I fill in Description with 'This is an updated interesting new entry'$/) do
  fill_in("Description", :with => "This is an updated interesting new entry")
end

And(/^I click Delete$/) do
  page.accept_confirm do
    within(:css, "td[class='hstack gap-1']") do
      find(".btn.btn-danger").click
    end
  end
end

Then(/^I should see "([^"]*)" in the list of entries$/) do |title|
  expect(page).to have_content(title)
end

When(/^I click the 'Generate PDF' button$/) do
  click_on("Generate PDF")
end

Then(/^I should see a '\.pdf' page$/) do
  page.title
  page.has_title? ".pdf", exact:false
end

When(/^I click the Show button$/) do
  within(:css, "td[class='hstack gap-1']") do
    find(".btn.btn-secondary").click
  end
end

And(/^I fill in URL with 'https:\/\/google\.com\/"$/) do
  fill_in("Url", :with => "https://google.com")
end