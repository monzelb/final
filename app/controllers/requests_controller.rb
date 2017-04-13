class RequestsController < ApplicationController
 before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @location = current_user.home_address
    @key = ENV['google_maps_api_key']
    @requests = Request.geocoded.near(@location, 5).order("created_at")

  end

  def show
    @request = Request.find(params[:id])
    @location = Geocoder.coordinates(@request.address)
    @comments = Comment.where(request_id: @request.id).order("updated_at DESC")

  end

  def search
    @location= params[:address]
    @requests = Request.geocoded.near(@location, 10)
    @key = ENV['google_maps_api_key']
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.build(request_params)
    @location = @request.address
    @users = User.all
    if @request.save
      User.all.each do |user|
        if @request.distance_to(user.home_address) < 0.5 && !user.email.nil?
        UserMailer.request_notification(@request, user).deliver_now
        
        end
        flash[:success] = 'Request added!'
      end
      redirect_to requests_path
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end

  private

  def set_request
      @request = Request.find(params[:id])
    end

  def request_params
    params.require(:request).permit(:title, :address, :latitude, :longitude, :body, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :request_id, :user_id)
  end
end
