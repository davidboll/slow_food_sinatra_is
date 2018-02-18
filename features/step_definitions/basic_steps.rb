When(/^a customer visits a login page$/) do
  visit '/login'
end

Then(/^he should see text "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^he should see a form$/) do
  expect(page).to have_css 'form'
end

Then(/^he fills in input field "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in field_name, with: value
end

Then(/^he clicks a "([^"]*)" button$/) do |link_text|
  click_link_or_button link_text
end

Then(/^he is redirected to "([^"]*)" page$/) do |arg1|
  expect(page.current_path).to eq '/'
end

Then(/^show me the page$/) do
  save_and_open_page
end

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


Given(/^a user with "([^"]*)" with password "([^"]*)" exist$/) do |email, password|
  User.create!(email: email, password: password)
end