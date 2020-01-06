class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @events = Event.order(e_date_start: :desc).page(params[:page]).per(20)

    if params[:q] != nil
      params[:q]['title_or_content_address_cont_any'] = params[:q]['title_or_content_address_cont_any'].split(/[\p{blank}\s]+/)
      @q = Event.ransack(params[:q])
      @events = @q.result.order(e_date_start: :desc).page(params[:page]).per(20)
    else
      @q = Event.ransack(params[:q])
      @events = @q.result(distinct: true).order(e_date_start: :desc).page(params[:page]).per(20)
    end
  end

  def search
     @q = Event.search(search_params)
     @events = @q.result(distinct: true)
  end

  def show
    # binding.pry
    if user_signed_in?
      @favorite = current_user.favorites.find_by(event_id: @event.id)
      @parthicipante = current_user.parthicipant_managements.where(event_id: @event.id)
    end
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def edit
  end

  def create
    # binding.pry
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def confirm
    @event = current_user.events.build(event_params)
    @label_ids = event_params[:label_ids]
    render :new if @event.invalid?
  end

  def favorite
    @favorites = current_user.favorite_events
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :image, :image_cache, :o_id, :e_date_start, :e_date_end, :address, label_ids: [])
  end

  def search_params
    params.require(:q).permit!
  end
end
