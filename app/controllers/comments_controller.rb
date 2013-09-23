class CommentsController < ApplicationController
  def comments_params
    params.require(:comment).permit(:author_name, :body)
  end
  
  def create
    @comment = Comment.new(comments_params)
    @comment.article_id = params[:article_id]
    
    @comment.save
    
    redirect_to article_path(@comment.article)
  end
end
