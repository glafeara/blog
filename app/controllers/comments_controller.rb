class CommentsController < ApplicationController

  before_action :signed
  before_action :premission_for_posts
  before_action :add_user_id

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.errors.any?
      render 'articles/show'
    else
      redirect_to @article
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private

    def comment_params
      params.require(:comment).permit(:comment, :user_id)
    end

   def add_user_id
     params[:comment][:user_id] = current_user.id
   end

end
