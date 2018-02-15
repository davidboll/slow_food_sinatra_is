Feature: User login feature
  As a customer
  in order to be able to order food
  I would like to become a registered user.

  Scenario:
    When a customer visits a login page
    Then he should see text "Please login!"
    And he should see a form
    And he fills in input field "Email" with "test@test.com"
    And he fills in input field "Password" with "12345"
    Then he clicks a "login" button
    And then he is redirected to "menu" page 
