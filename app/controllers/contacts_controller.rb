class ContactsController < ApplicationController
  before_action :set_family
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    @contacts = Contact.where(family: @family).order(id: 'ASC')
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.family = @family
    if @contact.save
      redirect_to family_contacts_path(@family)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to family_contacts_path(@family)
    else
      render :new
    end
  end

  def destroy
    @contact.destroy
    redirect_to family_contacts_path(@family)
  end

  private

  def set_family
    @family = Family.find(params[:family_id])
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :comment)
  end
end
