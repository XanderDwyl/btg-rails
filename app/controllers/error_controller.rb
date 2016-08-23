class ErrorController < ApplicationController
  def not_found
    render :json => "404 not found!"
  end
end
