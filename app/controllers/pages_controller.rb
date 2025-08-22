class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # TODO: remove after the presentation
    if user_signed_in?        
      redirect_to routines_path    
    end
  end
end
