Feature: Login
  As a user in order to use the application,
  I want to login with valid email and password, 
  after login validate the following scenarios:
  - In the tab 'Verträge' assert that there are 3 contracts with 'Gut versichert'
  - In the tab 'Rente' assert that 'Dein Renteneinkommen' ist above 2400 Euro
  - In the tab "Bedarf" assert 'Du hast alle empfohlenen Produkte!' in the left column.
  - Then click on 'Clark jetzt empfehlen' and invite a friend via email. Assert that the
  success message under the input field had been shown. 

  Scenario: Logging in with invalid credentials
	  Given As a user I launch 'https://clark.de' website
    Then I click on 'Einloggen' button
		And I enter invalid credentials 'E-Mail' and 'Passwort'
    When I click on 'Login' button
		Then I receive a message containing 'E-Mail-Adresse oder Passwort ungültig.'
		And I see 'Login' page again

  Scenario: Logging in with valid credentials
    Given As a user I launch 'https://clark.de' website
    Then I click on 'Einloggen' button
		And I enter valid credentials 'E-Mail' and 'Passwort'
    When I click on 'Login' button
		Then I see home page is displayed with a welcome "message"

  Scenario: In the tab 'Verträge' assert that there are 3 contracts with 'Gut versichert'
    Given I launch tab 'Verträge'
    When I inside tab 'Verträge'
    Then I see that there are 3 contracts with 'Gut versichert'

  Scenario: In the tab 'Rente' assert that 'Dein Renteneinkommen' ist above 2400 Euro
    Given I launch tab 'Rente'
    When I'm inside tab 'Rente'
    Then I see that 'Dein Renteneinkommen' ist above 2400 Euro

  Scenario: In the tab "Bedarf" assert 'Du hast alle empfohlenen Produkte!' in the left column
    Given I launch tab 'Bedarf'
    When I'm inside tab 'Bedarf'
    Then I see 'Du hast alle empfohlenen Produkte!' in the left column

  Scenario: Then click on 'Clark jetzt empfehlen' and invite a friend via email.
    Given I click on link 'Clark jetzt empfehlen'
    Then I enter 'Per E-Mail einladen'
    When I click on 'E-Mail senden' button
    Then I see success message under the input field had been shown
