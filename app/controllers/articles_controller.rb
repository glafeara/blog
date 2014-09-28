class ArticlesController < ApplicationController

  before_action :signed,   except: :show
  before_action :is_admin, only: [ :index, :destroy ]
  before_action :this_is_his_article, only: :edit
  before_action :premission_for_posts, only: :new

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    get_categories
  end

  def create
    @article = current_user.articles.create(article_params)
    get_categories
    if @article.errors.empty?
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    set_article
    @categories = Category.all
  end

  def update
    set_article.update(article_params)
    get_categories
    if @article.errors.empty?
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    set_article
  end

  def destroy
    set_article.destroy
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:header, :description, :article, :category_id, :user_id)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def this_is_his_article
      if @current_user.id != set_article.user_id && !@current_user.isadmin
        flash[:alert] = 'Вы не можете редактировать чужие статьи!'
        redirect_to set_article
      end
    end

    def premission_for_posts
      unless @current_user.checked
        flash[:alert] = 'Ваш аккаунт ещё не проверен администратором'
        redirect_to current_user
      end
    end

end
