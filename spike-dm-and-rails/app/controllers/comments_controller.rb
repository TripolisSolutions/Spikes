class CommentsController < ApplicationController

  def create
    post = Post.get(params['post_id'])
    post.comments.create(params['comment'])
    redirect_to post
  end

end