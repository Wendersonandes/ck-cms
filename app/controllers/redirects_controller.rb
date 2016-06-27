class RedirectsController < ApplicationController

  def new
    @redirect = Redirect.new
  end

  def create
    @redirect = Redirect.create(redirect_params)
    if @redirect.save
      flash[:notice] = "Redirect created"
      redirect_to cama_root_path
    else
      flash[:alert] = "Redirect failed"
      render :new
    end
  end

  def show
    @redirect = Redirect.find(params[:id])
    redirect_to @redirect.original_url
  end

  private

  def redirect_params
    params.require(:redirect).permit(:original_url)
  end
end