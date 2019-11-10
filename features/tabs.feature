Feature: Validate the tabs in home page after logged in

  After login validate the following scenarios:
  - In the tab 'Verträge' assert that there are 3 contracts with 'Gut versichert'
  - In the tab 'Rente' assert that 'Dein Renteneinkommen' ist above 2400 Euro
  - In the tab 'Bedarf' assert 'Du hast alle empfohlenen Produkte!' in the left column.
  - Then click on 'Clark jetzt empfehlen' and invite a friend via email. Assert that the
  success message under the input field had been shown. 

  Background:
    Given I am in home page after logged in
  
  Scenario: In the tab 'Verträge' assert that there are 3 contracts with 'Gut versichert'
    Given I launch tab 'Verträge'
    When I inside tab 'Verträge'
    Then I see that there are 3 contracts with 'Gut versichert'

  Scenario: In the tab 'Rente' assert that 'Dein Renteneinkommen' ist above 2400 Euro
    Given I launch tab 'Rente'
    When I'm inside tab 'Rente'
    Then I see that 'Dein Renteneinkommen' ist above 2400 Euro

  Scenario: In the tab 'Bedarf' assert 'Du hast alle empfohlenen Produkte!' in the left column
    Given I launch tab 'Bedarf'
    When I'm inside tab 'Bedarf'
    Then I see 'Du hast alle empfohlenen Produkte!' in the left column

  Scenario: Then click on 'Clark jetzt empfehlen' and invite a friend via email.
    Given I click on link 'Clark jetzt empfehlen'
    Then I enter 'Per E-Mail einladen'
    When I click on 'E-Mail senden' button
    Then I see success message under the input field had been shown