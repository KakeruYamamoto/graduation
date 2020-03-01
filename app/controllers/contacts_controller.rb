class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :update]

  def index
    @events = current_user.events
    event_array = @events.map {|event| event.contacts unless nil? }
    @contacts = event_array.flatten
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
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to @contact, notice: 'お問い合わせを送信しました！'
    else
      render :new
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'お問い合わせを削除しました！'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:title, :email, :content, :event_id, :name)
  end
end
