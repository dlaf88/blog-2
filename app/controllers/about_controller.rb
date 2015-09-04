class AboutController < ApplicationController
  def show
  end 
  def contact
  end
  def email
    
    AboutMailer.contact_email(params[:name],params[:email],params[:phone],params[:message]).deliver
    flash[:notice] = t('.notice')
    redirect_to root_path
  end 
end
