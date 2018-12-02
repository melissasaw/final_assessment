class UsersController < ApplicationController

	def index
		users = User.all
	end

	def new
		@user= User.new
	end

	def create
		user= User.new(get_params)
		if user.save
			redirect_to root_path
			flash[:success] = "Woohoo! User successfully created! Sign In below."
		else
			render 'new'
		end
	end

	def sign_in
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

private

def get_params

params.require(:user).permit(:first_name,:last_name,:email,:password,:birthday,:gender)
end

end
