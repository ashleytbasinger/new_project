class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @timeline = Timeline.find(params[:timeline_id])
    @photos = @timeline.photos.all
  end

  def show
    @timeline = Timeline.find(params[:timeline_id])
    @photo = @timeline.photos.find(params[:id])
  end

  def new
    @photo = Photo.new
    #@timeline = Timeline.find(params[:timeline_id])
    #@photo = @timeline.photos.new
  end

  def edit
    @timeline = Timeline.find(params[:timeline_id])
    @photo - @timeline.photos.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :date, :image, :timeline_id, :user_id)
    end
end
