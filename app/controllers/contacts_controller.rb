class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    @family = Family.find(params[:family_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @family = Family.find(params[:family_id])
    @contact.family = @family
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :comment)
  end
end
