class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action:destroy_message, only: [:destroy]

  def index
    @events = Event.order(e_date_start: :desc).page(params[:page]).per(12)

    if params[:q] != nil
      params[:q]['title_or_content_address_cont_any'] = params[:q]['title_or_content_address_cont_any'].split(/[\p{blank}\s]+/)
      @q = Event.ransack(params[:q])
      @events = @q.result.order(e_date_start: :desc).page(params[:page]).per(12)
    else
      @q = Event.ransack(params[:q])
      @events = @q.result(distinct: true).order(e_date_start: :desc).page(params[:page]).per(12)
    end
  end

  def search
     @q = Event.search(search_params)
     @events = @q.result(distinct: true)
  end

  def show
    if user_signed_in?
      @favorite = current_user.favorites.find_by(event_id: @event.id)
      @current_user_parthicipant = current_user.parthicipant_managements.find_by(event_id: @event.id)
      @parthicipante = @event.parthicipant_managements.where(event_id: @event.id)
      @parthicipante_users = @event.parthicipante_users#.where(event_id: @event.id)
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

  def confirm
    @event = current_user.events.build(event_params)
    @label_ids = event_params[:label_ids]
    render :new if @event.invalid?
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        if @event.parthicipante_users.present?
          @event_info = @event
          @event.parthicipante_users.each do|event_parthicipante_user|
            EventChangeMailer.event_change(event_parthicipante_user.email,@event_info).deliver
          end
        end
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def favorite
    @favorites = current_user.favorite_events
  end

  def parthicipante_events
    @parthicipante_events = current_user.parthicipante_events
  end

  def destroy
    @event.destroy
    # binding.pry
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :image, :image_cache, :e_date_start, :e_date_end, :address, label_ids: [])
  end

  def search_params
    params.require(:q).permit!
  end

  def destroy_message
    @event.parthicipante_users.each do|event|
      EventDestroyMailer.event_destroy(event.email,@event).deliver
    end
  end

  def contact_params
    params.require(:contact).permit(:title, :email, :content, :event_id, :name)
  end

end
