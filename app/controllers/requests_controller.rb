class RequestsController < ApplicationController
 before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @location = Request.first
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @message = Message.new
  end

  def search
    @location= Request.geocoded.near(params[:address], 10).first
    @requests = Request.geocoded.near(@location, 10)
    @address = params[:address]
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
end
