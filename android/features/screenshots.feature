Feature: Application screenshots

  Scenario: Welcome screen
    Given I see "Hello and welcome to"
    Then I swipe to 2nd welcome tab
    Then I swipe to 3rd welcome tab
    Then I swipe to 4th welcome tab
    Then I swipe to 5th welcome tab
    When I press "Done"
    Then I should see "Going to the Movies?"

  Scenario: Movie details screen
    Given I skip welcome screen
    When I select In Theaters tab
    Then I should see movie posters
    When I press on 2st poster
    Then I should see movie details
    When I start the trailer
    And I wait for 10 seconds
    When I press back button with delay
    Then I scroll down to see movie details
    Then I scroll down to see movie details
    Then I scroll down to see movie details

  Scenario: Box office movies screen
    Given I skip welcome screen
    When I select In Theaters tab
    Then I should see movie posters
    Then I select See More in theaters
    And I press List View
    Then I swipe the screen to the left
    And I press Grid View
    Then I swipe the screen to the left
    And I press List View

  Scenario: Search screen
    Given I skip welcome screen
    When I select In Theaters tab
    Then I should see movie posters
    When I search for movie "Creed"
    Then I should see "Creed" result

  Scenario: Settings screen
    Given I skip welcome screen
    When I select In Theaters tab
    Then I should see movie posters
    When I press on settings button and wait
    Then I press My Location
    When I press back button on My location screen
    Then I press on settings button
    Then I press My Theaters
    When I press back button on My Theaters screen
    Then I press on settings button
    Then I press mPOINTS Rewards
    Then I press X to close rewards screen
    Then I press on settings button
    Then I press Settings