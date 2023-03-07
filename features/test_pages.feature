Feature: Can the pages be loaded successfully?
  Helps to determine the journal was successfully opened

Scenario: Check the title of the root (Home) page
  Given I am on the journal home page
  When I click Home
  Then I should see 'Welcome to Journal'

Scenario: Check the title of the About page
  Given I am on the About page
  Then I should see 'About Journal'

Scenario: Check the title of the Sign Up page
  Given I am on the Sign Up page
  Then I should see 'Sign Up'

Scenario: Check the title of the Login page
  Given I am on the Login page
  Then I should see 'Login'

Scenario: Test the inactivity timer
  Given I have logged in
  And I am on the Items page
  When I have been inactive for 65 seconds
  And I click the 'New item' button
  Then I should see 'Login'