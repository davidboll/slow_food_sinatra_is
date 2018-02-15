
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
end

Then(/^he clicks a "([^"]*)" button$/) do |link_text|
  click_link_or_button link_text
end

Then(/^he is redirected to "([^"]*)" page$/) do |arg1|
  expect(page.current_path).to eq "/"
end

Then(/^show me the page$/) do
  save_and_open_page
end
