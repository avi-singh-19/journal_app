Feature: Check users can login, edit passwords and not get errors
  Helps verify login processes work and editing passwords do not cause errors

Scenario: Check I can Login properly
Given I am on the Login page
And I should see 'Login'
When I fill in Email with 'test@email.com'
And I fill in Password with 'pass'
And I click the "Sign In" button
Then I should see 'Welcome to Journal'
And I should get a login success alert

Scenario: Check I can edit my password
Given I have logged in
And I am on the Edit Password page
When I fill in Password with 'pass'
And I fill in Confirmation with 'pass'
And I click the "Update Password" button
Then I should get an updated password alert
And I should see 'Welcome to Journal'

Scenario: Check updated password and non matching confirmation do not get updated on Edit Password page
Given I have logged in
And I am on the Edit Password page
When I fill in Password with 'pass'
And I click the "Update Password" button
Then I should get an error that passwords do not match