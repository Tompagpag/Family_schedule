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
      redirect_to family_contacts_path(@family)
    else
      render :new
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to family_contacts_path(@family)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :comment)
  end
end
