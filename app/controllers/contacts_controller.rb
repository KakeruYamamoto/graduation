class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy]

  def index
    @contacts = current_user.event.contacts.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    # @contact =
    # if params[:event_owner_email]
    #   @event_owner_email ||= params[:event_owner_email]
    # end

    respond_to do |format|
      if @contact.save   #なぜにContactMailer.contact_mailが呼び出せるか？継承もされていないのに
        ContactMailer.contact_mail(@contact).deliver#これを追記することで、お問い合わせ内容が保存された時にContactMailerのcontact_mailメソッドを呼ぶ
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
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
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
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
