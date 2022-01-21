class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(
      text: params.require(:comment).permit(:text)[:text],
      user_id: current_user.id,
      post_id: @post.id
    )
    new_comment.update_commment_count
    if new_comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end
end
