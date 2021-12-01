class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)

    FamilyMember.create!(user: current_user,
                        admin: true,
                        family: @family,
                        first_name: current_user.first_name,
                        last_name: current_user.last_name)

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
