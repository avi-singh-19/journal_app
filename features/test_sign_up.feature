Feature: Can I fill in the sign up form successfully?
  Helps to test what should happen when inputs are passed into Sign Up

Scenario: Fill in form with all valid details
  Given I am on the Sign Up page
  And I should see 'Sign Up'
  When I fill in Email with 'test@email.com'
  And I fill in Password with 'pass'
  And I fill in Confirmation with 'pass'
  And I click the "Sign Up" button
  Then I should get a success alert
  And I should see 'Welcome to Journal'

Scenario: Fill in form with bad email but good password
  Given I am on the Sign Up page
  And I should see 'Sign Up'
  When I fill in Email with 'garbage_barge'
  And I fill in Password with 'pass'
  And I fill in Confirmation with 'pass'
  And I click the "Sign Up" button
  Then I should get an error that this is wrong
  And I should see 'Sign Up'

Scenario: Fill in form with good email but blank password
  Given I am on the Sign Up page
  And I should see 'Sign Up'
  When I fill in Email with 'test@email.com'
  And I click the "Sign Up" button
  Then I should get an error that this is wrong
  And I should see 'Sign Up'

Scenario: Fill in form with good email, valid password but non matching confirmation
  Given I am on the Sign Up page
  And I should see 'Sign Up'
  When I fill in Email with 'test@email.com'
  And I fill in Password with 'pass'
  And I click the "Sign Up" button
  Then I should get an error that this is wrong
  And I should see 'Sign Up'

Scenario: Fill in form with all bad details
  Given I am on the Sign Up page
  And I should see 'Sign Up'
  When I fill in Email with 'garbage_barge'
  And I fill in Password with 'pass'
  And I click the "Sign Up" button
  Then I should get an error that this is wrong
  And I should see 'Sign Up'