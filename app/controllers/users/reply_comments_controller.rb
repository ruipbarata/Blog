class Users::ReplyCommentsController < Users::UsersController

  def create
    @comment = Comment.find(params[:comment_id])
    @reply_comment = @comment.reply_comments.create(reply_comment_params.merge(user_id: current_user.id))

    @article = Article.find(params[:article_id])
    redirect_to published_article_path(@article)
  end

  private

    def reply_comment_params
      params.require(:reply_comment).permit(:body)
    end

end
