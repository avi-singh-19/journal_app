Feature: : Do the interactive elements on a page work?
  Helps verify buttons, redirect links etc on pages work properly

Scenario: Check the 'Get Started' button on 'Home' page when not logged in
  Given I am on the journal home page
  And I should see 'Welcome to Journal'
  When I click the "Get started" button
  Then I should see 'Sign Up'

Scenario: Check the 'Resume Journaling' button on 'Home' page when logged in
  Given I have logged in
  And I am on the journal home page
  And I should see 'Welcome to Journal'
  When I click the "Resume Journaling" button
  Then I should see 'Items'

Scenario: Check the 'Learn more about Journal' button on 'Home' page
  Given I am on the journal home page
  And I should see 'Welcome to Journal'
  When I click the "Learn more about Journal" button
  Then I should see 'About Journal'

Scenario: Check the 'Login' button on 'Home' page
  Given I am on the journal home page
  And I should see 'Welcome to Journal'
  When I click the "Login" button
  Then I should see 'Login'

Scenario: Check the 'Create an account' button on 'About' page
  Given I am on the About page
  And I should see 'About Journal'
  When I click the 'Create an account' button
  Then I should see 'Sign Up'

Scenario: Check 'Already have a Journal account?' button on 'Sign Up' page
  Given I am on the Sign Up page
  And I should see 'Sign Up'
  When I click the "Already have a Journal account? Click here to login" button
  Then I should see 'Login'

Scenario: Check 'Don't have a Journal account? Click here to sign up' button on 'Login' page
  Given I am on the Login page
  And I should see 'Login'
  When I click the "Don't have a Journal account? Click here to sign up" button
  Then I should see 'Sign Up'