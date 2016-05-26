Feature: Application sreenshots

  Scenario: Welcome screen
    Given I wait to see "Hello and welcome to"
    Then I swipe to 2nd welcome tab
    Then I swipe to 3rd welcome tab
    Then I swipe to 4th welcome tab
    When I press Done button
    Then I should see Going to The Movies dialog

  Scenario: Movie details screen
    Given I skip welcome screen
    Then I press In Theaters tab
    Then I should see movie posters
    When I press on 2st poster
    Then I should see movie details
    When I start the trailer
    And I wait for 10 seconds
    When I press X button to close trailer
    Then I scroll down to see movie details
    Then I scroll down to see movie details
    Then I scroll down to see movie details

  Scenario: In Theaters screen
    Given I skip welcome screen
    Then I press In Theaters tab
    Then I should see movie posters
    Then I scroll down to see page details
    Then I scroll down to see page details
    Then I scroll down to see page details
    Then I scroll down to see page details

  Scenario: Featured screen
    Given I skip welcome screen
    Then I should see In Theaters screen
    Then I scroll down to see page details
    Then I scroll down to see page details
    Then I scroll down to see page details
    Then I scroll down to see page details

  Scenario: At Home screen
    Given I skip welcome screen
    Then I press At Home tab
    Then I should see At Home screen
    Then I scroll down to see page details
    Then I scroll down to see page details
    Then I scroll down to see page details
    Then I scroll down to see page details

  Scenario: Search screen
    Given I skip welcome screen
    Then I should see In Theaters screen
    When I search for movie "Star Wars"
    Then I should see "Star Wars: The Force Awakens" result

  Scenario: Settings screen
    Given I am on the Home screen
    When I open Settings
    Then I press My Location
    And I press Cancel
    Then I press My Theaters
    And I press back button
    Then I press View mPOINTS
    And I press back button
    Then I scroll down to see page details
    Then I press Send Feedback
    And I press back button
    Then I press Legal
    And I press back button
    Then I press More Apps By AOL
    And I press back button

#  Scenario: Login screen
#    Given I am on the Home screen
#    When I open Settings