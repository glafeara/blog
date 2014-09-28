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
<<<<<<< HEAD
    set_category
  end

  def update
    set_category.update(category_params)
=======
    find_category
  end

  def update
    find_category.update(category_params)
>>>>>>> 993e6f41ad2198e6cd555695103a3b3aca85aac0
    if @category.errors.empty?
      redirect_to @category
    else
      render 'edit'
    end
  end

  def show
<<<<<<< HEAD
    set_category
  end

  def destroy
    set_category.destroy
=======
    find_category
  end

  def destroy
    find_category.destroy
>>>>>>> 993e6f41ad2198e6cd555695103a3b3aca85aac0
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
