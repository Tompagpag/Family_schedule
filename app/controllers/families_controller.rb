class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)

    if @family.save!
      redirect_to family_path(@family)
    else
      render :new
    end
  end

  def show
  end

  private

  def family_params
    params.require(:family).permit(abyme_attributes, :last_name)
  end
end
