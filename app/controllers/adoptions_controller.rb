class AdoptionsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @application = Application.find(params[:id])
    Adoption.create!(pet: @pet, application: @application)
    redirect_to "/applications/#{@application.id}"
  end
end
