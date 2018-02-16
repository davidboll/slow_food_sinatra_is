Feature: User register feature
  As a customer
  in order to be able to order food
  i would like to become a registered user.

  Scenario:
    When a customer visits a register page
    Then he should see text "Please register!"
    #And show me the page
    And he fills in input field "Email" with "test@test.com"
    And he fills in input field "Password" with "12345"
    And he fills in input field "Password again" with "12345"
    And he clicks a "Submit" button
    Then he is redirected to "menu" page
