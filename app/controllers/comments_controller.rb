class CommentsController < ApplicationController

  before_action :signed
  before_action :premission_for_posts
  before_action :add_user_id, except: :destroy
  before_action :this_is_his_comment, only: :destroy

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
    set_comment
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

    def set_comment
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
    end


    def this_is_his_comment
      if @current_user.id != set_comment.user_id && !@current_user.isadmin
        flash[:alert] = 'Вы не можете удалять чужие комментарии!'
        redirect_to @article
      end
    end

end
