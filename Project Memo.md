#The Lion Fish Scuba Shop
**Author:** Dorian Karter

**What is it:**  A final project for CS 445 - Object Oriented Design Programming.

**College:** Illinois Institute of Technology

#Project Memo##Project StatusThe full requirements for functionality of the software have been implemented. This web app was built for the owner of the business only. 

###Tours
- the ability to create (valid) tours
- define their parameters
- cancel them (with refund to customers)
- search by dates
- see details
- edit the tours.
- automatically refund difference on fully paid bookings to customers on price decrease

###Bookings
- create a (valid) booking for customer for a specific tour
- pay for booking or leave it unpaid (once paid setting to unpaid will not refund the money -for that you need to cancel the booking [to activate the logic])
- Cancel a booking
- Edit a booking
-  see the price you need to pay per seats selected (only in the modal popup form where the tour selected is known before the form loads)


###Customers
- Create a (valid) customer (must have unique email)
- Delete customer
- See all customer transactions/bookings and spendings/refunds
- see total spent by customer
- edit customer details

###Reports
- see all ‘Accounting Transactions’ money in/out
- everything is automated
- allow deleting of record but with warning that it might mess up the data (feature relatively hidden)
- view total earnings for business
- see reason for transactions
- auto color coded for easy differentiation


##Project DetailsThe project was built using *Ruby v1.9.3*, *Rails 3.2*, *CoffeeScript*, *JavaScript*, *Sass*, and *CSS*.The database used is *SQLite 3* for development and test and *PostgreSQL* for production.For UI Twitter Bootstrap was used.

##Deliverables
###Web InterfaceThe project can be accessed via the web interface athttp://lfss.herokuapp.com

###Source CodeThe repository can be cloned at https://github.com/dkarter/The-Lion-Fish-Scuba-Store or by using the following command:	
	$> git clone git@github.com:dkarter/The-Lion-Fish-Scuba-Store.git

###Building
The project can be built by running the following command:

	$> bundle install

The database can then be populated by using the following commands:

	$> rake db:migrate The app can then be run by using the following command:

	$> rails s 
And visiting localhost:3000/ on your browser.

###Testing
Basic tests for user interaction were developed using Cucumber and Capybara, but **not completed** due to time constraints.Test case files can be found in the ‘features’ directory of the code. Test can be run via the following command:	
	$> cucumber features/

##Additional Details###Hours to completion: 
I estimate around 110 hours including design, setup, and learning required.
###Difficulties:My biggest difficulty was writing the tests in *Cucumber* and *Capybara* since I have never used these technologies before. I was running out of time and decided to skip most of them and just jump right into functionality. 

The functionality took a very long time to develop and perfect and I was trying to learn *Sass* and *CoffeeScript* along the way to make the interface perfect while picking up new skills.It was a very stressful but an enjoyable learning experience.