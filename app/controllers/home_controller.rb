class HomeController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    render json: { author: 'rykn0wxx' }
  end
end
