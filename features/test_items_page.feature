Feature: How well does the 'Items' entry page respond to inputs and accesses
  Helps verify the access to and use of the elements related to the Items page work properly

Scenario: Check I cannot access the 'Items' page unless logged in
  Given I am on the journal home page
  And I should see 'Welcome to Journal'
  When I try and manually access the 'Items' page
  Then I should get an error that I cannot access that page
  And I should see 'Login'

Scenario: Check I can access the 'Items' page when logged in
  Given I have logged in
  When I am on the Items page
  Then I should see 'Items'

Scenario: Check I can create access 'New item' page
  Given I have logged in and I am on 'Items'
  When I click the 'New item' button
  Then I should see 'New item'

Scenario: Check I have to fill in a valid title and descriptor for an entry
  Given I am on the 'New item' page
  When I click Save
  Then I should see 'New item'

Scenario: Check I can create and delete an item
  Given I am on the 'New item' page
  And I should see 'New item'
  When I fill in Name with 'Test Entry'
  And I fill in Description with 'This is a test entry'
  And I fill in URL with 'https://google.com/"
  And I click Save
  Then I should see 'Items'
  And I click Delete
#  Then I should see an alert on screen and click 'OK'

Scenario: Check I can edit an existing item
  Given I have created an item
  And I am on the Items page
  And I should see 'Items'
  When I click the Edit button
  Then I should see 'Editing item'
  And I fill in Name with 'Edited new item'
  And I fill in Description with 'This is an updated interesting new entry'
  And I click Save
  Then I should see 'Items'
  And I click Delete

Scenario: Check I can access PDF for all entries
  Given I have created an item
  And I am on the Items page
  And I should see 'Items'
  When I click the 'Generate PDF' button
  Then I should see a '.pdf' page
  When I am on the Items page
  And I should see 'Items'
  Then I click Delete

Scenario: Check I can access an individual PDF for one entry
  Given I have created an item
  And I am on the Items page
  And I should see 'Items'
  When I click the Show button
  And I click the 'Generate PDF' button
  Then I should see a '.pdf' page
  When I am on the Items page
  And I should see 'Items'
  Then I click Delete

Scenario: Check I can add an image to an entry
  Given I have logged in and I am on 'Items'
  And I click the 'New item' button
  And I fill in Name with 'Test Entry'
  And I fill in Description with 'This is a test entry'
  And I click the 'Choose file' button
  When I click Save
  Then I should see 'Items'
  And I click Delete

Scenario: Check I can remove an image from an entry
  Given I have created an image item
  And I am on the Items page
  When I click the Edit button
  Then I click the 'Remove Image' button
  And I click Save
  Then I should see 'Items'
  And I click Delete