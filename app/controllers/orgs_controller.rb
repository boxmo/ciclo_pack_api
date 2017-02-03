class OrgsController < ApplicationController
  include ActionController::Serialization

  def index
    @orgs = Org.all
    render json: @orgs
  end

  def create
    @org = Org.new(org_params)

    if @org.save
      render json: @org, status: :ok
    else
      render json: { error: @org.errors.messages }, status: 400
    end
  end

  private

  def org_params
    params.require(:org).permit(:name, :bio)
  end

end
