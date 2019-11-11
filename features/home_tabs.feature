Feature: Validate the tabs in home page after logged in and invite a friend via email

  After login validate the following scenarios:
  - In the tab 'Verträge' assert that there are 3 contracts with 'Gut versichert'
  - In the tab 'Rente' assert that 'Dein Renteneinkommen' ist above 2400 Euro
  - In the tab 'Bedarf' assert 'Du hast alle empfohlenen Produkte!' in the left column.
  - Then click on 'Clark jetzt empfehlen' and invite a friend via email. Assert that the
  success message under the input field had been shown. 
  
  Scenario: Validate tabs in home page and invite friend via email
    Given I am in home page after logged in
    Then I launch tab Verträge
    When I am in tab Verträge
    Then I see that there are three contracts with 'Gut versichert'
    Then I launch tab Rente
    When I am in tab Rente
    Then I see that Dein Renteneinkommen is above 2400 Euro
    Then I launch tab Bedarf
    When I am in tab Bedarf
    Then I see 'Du hast alle empfohlenen Produkte!' in the left column
    Then I click on Clark jetzt empfehlen
    Then I enter Per E-Mail einladen
    When I click on E-Mail senden button
    Then I see success message under the input field had been shown