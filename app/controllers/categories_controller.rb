class CategoriesController < ApplicationController

  before_action :signed,   except: :show
  before_action :is_admin, only: [ :index, :destroy, :new, :edit  ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.errors.empty?
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    set_category
  end

  def update
    set_category.update(category_params)
    find_category
  end

  def update
    find_category.update(category_params)
    if @category.errors.empty?
      redirect_to @category
    else
      render 'edit'
    end
  end

  def show
    set_category
  end

  def destroy
    set_category.destroy
    find_category
  end

  def destroy
    find_category.destroy
    redirect_to categories_path
  end


  private

    def category_params
      params.require(:category).permit(:category)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
