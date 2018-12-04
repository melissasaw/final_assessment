class UsersController < ApplicationController
skip_before_action :verify_authenticity_token, :only => [:sign_in]
before_action :find_user, only: [:show,:edit,:update,:destroy]

	def index
		@users = User.all
	end

	def new
		@user= User.new
	end

	def create
		user= User.new(get_params)
		# Every user starts with 200 coins
		user.coins = 200
		# 
		if user.save
			redirect_to root_path
			flash[:success] = "Woohoo! User successfully created! Sign In below."
		else
			render 'new'
		end
	end

	def sign_in
		# If email is found, compare password
		if User.find_by(email:sign_in_params[:email])
			user = User.find_by(email:sign_in_params[:email])
			# if password matches, set up session, redirect to user/index page
			if user.authenticate(sign_in_params[:password])
				session[:user_id]=user.id
				redirect_to root_path
			else 
			# If password doesnt match, redirect to rootpath
			redirect_to root_path
			flash[:info] = "Invalid email/password"
			end
		else
			redirect_to root_path
			flash[:info] = "Invalid email/password"
		end
		

	end

	def sign_out
		session[:user_id]=nil
		redirect_to root_path
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def coin_generator
		
		# Convert json object back into an array
		coins = JSON.parse(params[:jsonData])[0]
		current_user.coins = current_user.coins + coins
		
		if current_user.save
			redirect_to root_path
			flash[:success] = "Hooray! " + coins.to_s + " pokécoins added to your wallet  >_< "
		else
			redirect_to root_path
			flash[:info] = "Coin generator broken! Please try again tmw :( "
		end

	end


private

def get_params
	params.require(:user).permit(:first_name,:last_name,:email,:password,:birthday,:gender)
end

def sign_in_params
	params.permit(:email, :password)
end

def find_user
	@user = User.find_by(id:params[:id])
end

end
