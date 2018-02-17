Feature: Customer can add a dish to the plate
  As a customer
  In order to choose my meal
  I want to be able to add my selected dish to my plate

  Background:
    Given There is a user in our database
    And The user is logged in as name
    And There is a dish names "Pizza" in our database

  Scenario: User clicks add_to_plate button
    When I click add_to_plate for "Pizza"
    Then My order should contain "1" item
    And The dish price is "120"
