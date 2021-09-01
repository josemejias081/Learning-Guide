class UsersController < ApplicationController
  def my_topics
    @categories = Category.all
    @categories = current_user.categories
    @topics = current_user.topics
    @pagy, @topics = pagy(current_user.topics.order("created_at DESC"), items: 10)
    if params[:topic_name]
      @pagy, @topics = pagy(@topics.search(params[:topic_name]), items: 10) 
    end

  end

  def my_categories
    @pagy, @categories = pagy(current_user.categories, items: 8) 

  end

end