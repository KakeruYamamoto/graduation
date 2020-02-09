class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :update]

  def index
    @events = current_user.events
    event_array = @events.map {|event| event.contacts unless nil? }
    @contacts = event_array.flatten #flatten
  end

  def show
  end

  def new
    @contact = Contact.new
    if params[:event_id]
      @contact[:event_id] = params[:event_id]
    end
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        ContactMailer.contact_mail(@contact).deliver
        format.html { redirect_to @contact, notice: 'お問い合わせを送信しました！' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'お問い合わせを削除しました！' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:title, :email, :content, :event_id, :name)
  end
end
