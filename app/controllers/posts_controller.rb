class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
	def new
		@post =Post.new
	end	

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts =Post.all
	end	

	def create
		#puts current_user.id
		#exit
  		@post = Post.new(params[:post].permit(:title, :text))
 		@post.user_id = current_user.id
  		if @post.save
    		redirect_to @post
  		else
    		render 'new'
  		end
	end

	def edit
  		@post = Post.find(params[:id])
	end

	def update
  		@post = Post.find(params[:id])
 
  		if @post.update(params[:post].permit(:title, :text))
    		redirect_to @post
  		else
    		render 'edit'
  		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

end
