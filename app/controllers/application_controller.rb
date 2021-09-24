class ApplicationController < ActionController::Base
  include Pagy::Backend
  #before_action :authenticate_user!
  before_action :authenticate_user!, except: [:index]
  
end
