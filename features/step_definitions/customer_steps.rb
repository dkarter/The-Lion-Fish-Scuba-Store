Given(/^I have customers named (.*?)$/) do |names| 
  names.replace('"','').split(', ').each do |name|
  	Customer.create(name: name)
  end
end

When(/^I (?:go to|am on) the "(.*?)" page$/) do |page|

  path = ""
  case page
  when "list of customers"
    path = customers_path()
  end

  visit(path)

  get_url_path(current_url).should == path
end


Then(/^I should see "(.*?)"$/) do |txt|
  page.should have_content(txt)
end

Given(/^I (?:should ){0,1}have (\d+) customers$/) do |count|
  Customer.count.should == count.to_i
end


When(/^I click (button|link) "(.*?)"$/) do |btn_type, btn_name|
  if btn_type == "link"
    click_link(btn_name)
  else
    click_button(btn_name)
  end
  
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |fld_name, value|
  fill_in(fld_name, :with => value)
end

Then(/^the url ends with "(.*?)"$/) do |str|
  get_url_path(current_url).ends_with?(str).should == true
end



