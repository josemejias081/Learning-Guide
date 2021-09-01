class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    
    @topic = Topic.new 
    @categories = Category.all
    
  end

  def create
    
    @categories = Category.all
    @topic = current_user.topics.create(topic_params)
    if @topic.save
      redirect_to @topic
    else
      render "new"
    end
  end

  def index
  end

  def show
    
  end

  def edit
    @categories = Category.all
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render "edit"
    end
  end

  def destroy 
    @topic.destroy
    redirect_to my_topics_path
  end
  

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end
    
    def topic_params
      params.require(:topic).permit(:name, :description, :link, :note, category_ids:[])
    end
end
