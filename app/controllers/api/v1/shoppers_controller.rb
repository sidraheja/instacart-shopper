class Api::V1::ShoppersController < ApplicationController
  before_action :set_shopper, only: [:show, :update, :destroy]

  def index
    @shoppers = Shopper.by_email(params[:email])
    json_response(@shoppers)
  end

  # POST /todos
  def create
    @shopper = Shopper.create!(shopper_params)
    json_response(@shopper, :created)
  end

  # GET particular shopper
  def show
    json_response(@shopper)
  end

  def update
    @shopper.update(shopper_params)
    head :no_content
  end

  def destroy
    @shopper.destroy
    head :no_content
  end

  private

  def shopper_params
    params.require(:data).require(:attributes).permit(:firstname, :lastname, :email, :phone)
  end

  def set_shopper
    @shopper = Shopper.find(params[:id])
  end
end