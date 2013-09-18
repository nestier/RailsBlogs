class PostsController < ApplicationController
	def new
	end
	def show
		@post = Post.find(params[:id])
	end
	def index
		@post =Post.all
	end			
	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end		
	end
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
