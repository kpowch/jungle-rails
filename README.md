# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. It's purpose was not just about learning a new language, ecosystem, and framework, but more so a simulation of the real world where an existing code base must be inherited in an unfamiliar language/framework.

## Getting Started
### Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

### Installing
1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars

### Running the App

To start the app, run the server: `bin/rails s -b 0.0.0.0` and visit `http://0.0.0.0:3000/` in the browser.

#### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Project Details
The following sections describe the project details - goals, stack, requirements, user stories, etc. This knowledge is not necessary to run the app.

### Goal

* Become familiar with Ruby and the Rails framework
* Learn how to navigate an existing code-base
* Use existing code style and approach to implement new features in unfamiliar territory
* Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
* A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

### Project Requirements

#### Feature: Sold Out Badge
* Major: When a product has 0 quantity, a sold out badge should be displayed on the product list page
* Minor: Should ideally be implemented as a question/boolean method in view helper and/or Product model

#### Feature: Admin Categories
* Major: Admin users can list and create new categories
* Major: Admins can add new products using the new category
* Major: Restful routes (resources) should be used, and there should be no extra, unused routes exposed
* Bonus: All admin controllers inherit from Admin::BaseController (or similarly named) abstract controller, containing the authentication filter

#### Feature: User Authentication
* Major: As a Visitor I can go to the registration page from any page in order to create an account
* Major: As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
* Major: As a Visitor I can sign in using my e-mail and password
* Major: As a User I can log out from any page
* Major: As a User I cannot sign up with an existing e-mail address (uniqueness validation)
* Major: Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem

#### Enhancement: Order Details Page
* Major: The order page contains items, their image, name, description, quantities and line item totals
* Major: The final amount for the order is displayed
* Minor: The email that was used to place the order is displayed
* Minor: As a Visitor I can place an order (i.e. without logging in and therefore without an e-mail address). The original functionality from the inherited code (even though it is not realistic) should therefore not be suppressed.

#### Feature: Email Receipt
* Major: The e-mail content should be (minimally) formatted with HTML
It does not need any layout styling and should be mostly, if not all, text (i.e. make do with <p></p>, <hr></hr>, <h1></h1>, <br /> and other simple formatting tags)
Since you don't know their name information, it can just have a generic greeting
* Major: It should list the total as well as each line item in the order
* Minor: The Order ID should be in the subject line

#### Bug: Missing Admin Security
* Major: User must enter HTTP auth login/password to access admin functionality
* Bonus: Should ideally be implemented in an abstract top-level class for admin controllers (e.g., Admin::BaseController which the other concrete admin controllers inherit)

#### Bug: Checking Out with Empty Cart
* Major: When the cart is empty and the user goes to the carts#show page, instead of displaying the contents and a stripe checkout button, display a friendly message about how it is empty and link to the home page

#### Feature: Product Rating
* Major: Use of nested resources in the routing, and not using custom controller actions
* Major: As a visitor I can view the overall rating of products as I browse the catalog
* Major: As a visitor I can view the list of ratings and reviews when viewing the product detail
* Major: As a logged in user I can rate & review a product in a single step
* Minor: As a logged in user I can delete a rating or review that I previously created

#### Automated Testing
* Use feature and unit tests to test fuctionality of various features
