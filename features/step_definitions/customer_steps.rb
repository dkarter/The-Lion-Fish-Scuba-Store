Given(/^I have customers named (.*?)$/) do |names| 
  names.split(', ').each do |name|
  	Customer.create(name: name)
  end
end

When(/^I go to the list of customers$/) do
  visit(customers_path())
end

When(/^I am on the list of customers$/) do
  URI.parse(current_url).should == customers_path()
end

Then(/^I should see "(.*?)"$/) do |txt|
  page.should have_content(txt)
end

Given(/^I have (\d+) customers$/) do |count|
  Customer.count.should == count.to_i
end


Then(/^the url end with "(.*?)"$/) do |str|
  URI.parse(current_url).ends_with?(str).should == true
end
