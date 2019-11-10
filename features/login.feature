Feature: Login
  As a user in order to use the application,
  I want to login with valid email and password

  Scenario: Invalid and valid credentials to login
    Given I am in clark website page
    Then I click on Einloggen button
		Then I enter invalid credentials email and password
    When I click on Login button
		Then I see an error message
		And I see Login page again
		Then I enter valid credentials email and password
    When I click on Login button again
		Then I see home page is displayed with a user profile icon on top right side
