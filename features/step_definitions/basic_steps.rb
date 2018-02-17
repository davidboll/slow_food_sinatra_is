Given(/^"([^"]*)" is in "([^"]*)"$/) do |product_name, menu_name|
  menu = Menu.find_or_create_by(name: menu_name)
  Product.create(name: product_name, menu: menu)
end

When(/^The user visits the site$/) do
  visit '/'
end

Then(/^Customer should see a "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^Customer should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Given(/^There is a user in our database$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^The user is logged in as name$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^There is a dish names "([^"]*)" in out database$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^The dish price is "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I can see the menu$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I click add_to_plate for "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^My order should contain "([^"]*)" item$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
