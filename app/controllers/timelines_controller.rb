class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  def index
    @timelines = Timeline.all
  end

  def show
    @timeline = Timeline.find(params[:id])
  end

  def new
    @timeline = Timeline.new
  end

  def edit
    @timeline = Timeline.find(params[:id])
  end

  def create
    @timeline = Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to @timeline, notice: 'Timeline was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timeline }
      else
        format.html { render action: 'new' }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_to @timeline, notice: 'Timeline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to timelines_url }
      format.json { head :no_content }
    end
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
