class UsersController < ApplicationController
before_action :authenticate_user, only: [ :show, :update, :delete ]
before_action :set_user, only: [ :show, :update, :delete ]

 def index
 	@users = User.all
 	render json: { result: true, users: @users }, status: :ok
 end	

 def show
 	render json: { result: true, user: @user }	
 end

 def create
	 @user = User.create(user_param)
	 if @user.save
	 	render json: { result: true, users: @user }, status: :created
	 else
	 	render json: { result: false, users: @user.errors }, status: :unprocessable_entity
	 end

 end 

 def update
 	if @user.update(user_param)
 		render json: { result: true, msg: "Update Success "}
 	else 
 		render json: { result: false, msg: "Update Failed "}
 	end
 end

def delete
	if @user.destroy
		render json: { result: true, msg: "Delete Success" }
	else
		render json: { result: false, msg: "Delete Failed" }
	end
end

 private
 def user_param
 	params.require(:user).permit(:username,:email,:password,:password_confirmation)
 end

 def set_user
 	@user = current_user
 end

end
