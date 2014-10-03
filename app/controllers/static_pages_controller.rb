class StaticPagesController < ApplicationController

  def index
    @articles = Article.all.paginate( page: params[:page], per_page: 5 )
  end

end
