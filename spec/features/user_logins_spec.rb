require 'rails_helper'

RSpec.feature "Visitor logs in", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Louis',
      last_name: 'Litt',
      email: 'peter@email.com',
      password: 'loveme',
      password_confirmation: 'loveme'
    )
  end

  scenario "They click login and navigate to home page" do
    visit login_path
    fill_in 'email', with: 'peter@email.com'
    fill_in 'password', with: 'loveme'
    within('.jumbotron') do
      click_button('Login')
    end

    save_screenshot
    expect(page).to have_content('Logout')
  end
end
