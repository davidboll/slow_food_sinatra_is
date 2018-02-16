Feature: Customer can see a menu
  As a customer
  in order to choose my meal
  I want to be able to see a selection of different dishes

  Background:
    Given "Pinnekjøtt" is in "Our Bites"
    And "Pizza" is in "Our Bites"

  Scenario: User visits a site and is able to see a menu on the landing page
    When The user visits the site
    Then Customer should see a "Our Bites"
    And Customer should see "Pinnekjøtt"
    And Customer should see "Pizza"
