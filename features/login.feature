Feature: Login
  As a customer In order to use the application
  I want to login with valid email and password

  Scenario: Logging in with invalid credentials
	  Given we visit the "website"
		And we put this credentials "john.nobody" and password "foo123"
		Then we receive a message containing an "alert"
		And we the login screen appears again 

  Scenario: Logging in with valid credentials
    Given we visit the "website"
	  And we put the good credentials
	  Then we click and we reach the home page with a welcome "message"   