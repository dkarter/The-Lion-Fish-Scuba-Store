Given(/^I have customers named (.*?)$/) do |names| 
  names['"'] = ''
  names.split(', ').each do |name|
  	Customer.create(name: name)
  end
end

Given(/^I (?:should ){0,1}have (\d+) customers$/) do |count|
  Customer.count.should == count.to_i
end






