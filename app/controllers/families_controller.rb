class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    FamilyMember.create(admin: true, user: current_user, family: @family)

    if @family.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @family = Family.find(params[:id])
  end

  private

  def family_params
    params.require(:family).permit(abyme_attributes, :last_name)
  end
end
