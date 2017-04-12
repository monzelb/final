class RequestsController < ApplicationController
 before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @location = Request.first
    @requests = Request.all
    @key = ENV['google_maps_api_key']
  end

  def show
    @request = Request.find(params[:id])
    @location = @request.address
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
    if @request.save
      flash[:success] = 'Request added!'
      redirect_to requests_path
    else
      render 'new'
    end
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
