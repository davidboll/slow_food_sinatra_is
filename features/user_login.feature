Feature: User login feature
  As a customer
  In order to be able to order food
  I would like to become a registered user.

  Background:
    Given a user with "test@test.com" with password "12345" exist

  Scenario:
    When a customer visits a login page
    And he fills in input field "Email" with "test@test.com"
    And he fills in input field "Password" with "12345"
    And he clicks a "Submit" button
    Then he is redirected to "menu" page
