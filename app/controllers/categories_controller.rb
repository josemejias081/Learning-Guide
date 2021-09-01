class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    
    @category = Category.new
  end

  def create
    
    @category = current_user.categories.create(category_params) 
    if @category.save
      redirect_to @category
    else
      render "new"
    end
  end

  def index
    @topics = Topic.all
    @categories = Category.all
  end

  
  def show
    @topics = Topic.all
  end

  def edit
   
  end

  def update
   
    if @category.update(category_params)
      redirect_to @category
    else
      render "edit"
    end
  end

  
  def destroy
    @category.destroy
    redirect_to my_categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :color, :topic_id)
    end
  end
