class PostsController < ApplicationController
before_action :authenticate_user, only: [ :create, :show, :update, :delete ]
before_action :set_post, only: [ :show ]

	def index
		@posts = Post.all
		render json: { result: true, posts: @posts }
	end

	def create
		@post = current_user.posts.create(post_param)
		if @post.save
			render json: { result: true, post: @post }, status: :created
		else
			render json: { result: false, post: @post.errors }, status: :unprocessable_entity
		end
	end

	def show
		@post = set_post
		render json: { result: true, post: @post }
	end


	private

	def post_param
		params.require(:post).permit(:title,:description)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
