class ArticlesController < ApplicationController
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
    
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  
  def new
    @article = Article.new
  end
  
  def create
    # fail # This will dump params in error view
    
    # Clean this up...
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    #
    # NOTE: this works but is unsafe:
    #@article = Article.new(params[:article])
    #
    # Instead, see article_params method above, which declares accepted params,
    # then pass that to the new article ctor.
    @article = Article.new(article_params)
    
    @article.save
    
    flash.notice = "Article '#{@article.title}' created"
    
    # redirect_to article_path(@article)
    redirect_to articles_path
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    flash.notice = "Article '#{@article.title}' updated"
    
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    flash.notice = "Article '#{@article.title}' deleted"
    
    redirect_to articles_path
  end
  
end
