class PostsController < ApplicationController

  def create
    current_user.posts.build(post_params)
    if current_user.save
      flash.notice = "Post created."
      redirect_back(fallback_location: current_user)
    else
      flash.notice = "Error. Not created."
      redirect_to current_user
    end
  end

  private

  def post_params
    response = params.require(:post).permit(:body)
    response["park_id"] = params[:park_id]
    response
  end

end
