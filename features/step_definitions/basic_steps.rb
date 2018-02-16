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
