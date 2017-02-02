class OrgsController < ApplicationController
  include ActionController::Serialization

  def index
    @orgs = Org.all
    render json: @orgs
  end

end
