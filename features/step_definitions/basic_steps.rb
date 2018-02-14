Given(/^"([^"]*)" is in "([^"]*)"$/) do |product_name, menu_name|
  menu = Menu.create(name: menu_name)
  Product.create(name: product_name, menu: menu)
end

When(/^The user visits the site$/) do
  # pending # Write code here that turns the phrase above into concrete actions
  visit '/'
end

Then(/^Customer should see a "([^"]*)"$/) do |product_name|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Customer should see "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
