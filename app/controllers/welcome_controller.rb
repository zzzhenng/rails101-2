class WelcomeController < ApplicationController
  def index
    flash[:notice] = "goodmorning"
  end
end
