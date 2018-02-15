<<<<<<< HEAD
Given(/^"([^"]*)" is in "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^The user visits the site$/) do
  visit '/'
end

Then(/^Customer should see a "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Customer should see "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
=======
When(/^a customer visits a login page$/) do
  visit '/login'
end

Then(/^he should see text "([^"]*)"$/) do |text|
   page.should have_content(text)
end

Then(/^he should see a form$/) do
  page.has_content?('form')
end

Then(/^he fills in input field "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
    fill_in(arg1, :with => arg2)
    fill_in(arg1, :with => arg2)
    #fill_in(password, :with => '12345')
end

Then(/^he clicks a "([^"]*)" button$/) do |arg1|
  click_button('login')
end

Then(/^then he is redirected to "([^"]*)" page$/) do |arg1|
   visit('/')
end

Then(/^show me the page$/) do
  save_and_open_page
>>>>>>> 893c6ba3ed7c608bb9e98d125c4f2f99b1f39e8b
end
