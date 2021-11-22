class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to family_conflicts_path(@family)
    else
      render :new
    end
  end

  def show
  end

  private

  def family_params
    params.require(:family).permit(:last_name)
  end
end
