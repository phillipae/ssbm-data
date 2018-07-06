class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def query
    result = Schema.execute(
      params[:query]
    )
    render json: result
  end
end
