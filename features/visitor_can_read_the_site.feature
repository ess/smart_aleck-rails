Feature: Visitor can read the site
  While they can't add anything, a Visitor should totally be able to read
  entries that have been posted to the site.

  Background:
    Given I'm a Visitor
    And the following Categories exist:
      | Name      |
      | popular   |
      | noticed   |
      | unpopular |
    And the following Entries exist:
      | Title | Categories        |
      | One   | popular, noticed  |
      | Two   | popular           |
      | Three | popular           |

  Scenario: What a Visitor sees
    When I visit the main site
    Then I see popular in the list of Categories
    And I see noticed in the list of Categories
    But I don't see unpopular in the list of Categories

  Scenario: What a Visitor does
    Given I'm on the main site
    When I click on the popular Category
    Then popular is removed from the possible Categories
    And I see the Two Entry
    And I see the Three Entry
    But I don't see the One Entry

    When I add the noticed Category to my current view
    Then noticed is removed from the possible Categories
    And I see the One Entry
    But I don't see the Two Entry
    And I don't see the Three Entry
