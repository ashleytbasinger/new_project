class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  def index
    @timelines = Timeline.all
  end

  def show
    @timeline = Timeline.find(params[:id])
    @photos = @timeline.photos
    @comment = @timeline.comments.build
  end

  def new
    @timeline = Timeline.new
  end

  def edit
    @timeline = Timeline.find(params[:id])
  end

  def create
    @timeline = Timeline.new(timeline_params)
      if @timeline.save
        redirect_to @timeline, notice: 'Timeline was successfully created.'
      else
        render action: 'new', notice: "Sorry- your timeline wasn't created. Try again!"
      end

  end

  def update
      if @timeline.update(timeline_params)
        redirect_to @timeline, notice: 'Timeline was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @timeline.destroy
  end

  private
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    def timeline_params
      params.require(:timeline).permit(:title, :user_id,
        photos_attributes: [:id, :title, :date, :comments,
          comments_attributes: [:id, :content]
        ]
      )
    end
end