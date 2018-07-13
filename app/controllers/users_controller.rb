class UsersController < ApplicationController
before_action :authenticate_user, only: [ :show ]
before_action :set_user, only: [ :show ]

 def index
 	@users = User.all
 	render json: { result: true, users: @users }, status: :ok
 end	

 def show
 	render json: { result: true, user: @user }	
 end

 def create
	 @user = User.create(create_param)
	 if @user.save
	 	render json: { result: true, users: @user }, status: :created
	 else
	 	render json: { result: false, users: @user.errors }, status: :unprocessable_entity
	 end

 end 

 private
 def create_param
 	params.require(:user).permit(:username,:email,:password,:password_confirmation)
 end

 def set_user
 	@user = current_user
 end

end
