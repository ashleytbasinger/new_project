class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @timeline = Timeline.find(params[:id])
    @photos = @timeline.photos.all
  end

  def show
    # @user = User.find(params[:user_id])
    # @timeline = @user.timelines.find(params[:id])
    # @photo = @timeline.photos.build(params[:photo])
    # @timeline = Timeline.find(params[:id])
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @timeline = Timeline.find(params[:id])
    @photo = @timeline.photos
  end

  def create
    @photo = Photo.new(photo_params)

      if @photo.save
        redirect_to @photo, notice: 'Photo was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @photo.update(photo_params)
        redirect_to @photo, notice: 'Photo was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @photo.destroy
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :date, :image, :timeline_id, :user_id)
    end
end
