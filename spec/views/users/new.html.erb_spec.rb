require 'rails_helper'

RSpec.feature "new", type: :feature do
	context "create new user" do
		scenario "should be successful" do
			visit new_user_path
				within ('form') do
				fill_in "user_first_name", :with => 'mel'
				fill_in 'user_last_name', :with => 'saw'
				fill_in 'user_birthday', :with => '19.09.1995'
				fill_in 'user_email', :with => 'melissa234@gmail.com'
				fill_in 'user_password', :with => 'qwerty'

			end
			click_button 'Create User'
			expect(page).to have_content("Woohoo! User successfully created! Sign In below.")
		end
	end
end