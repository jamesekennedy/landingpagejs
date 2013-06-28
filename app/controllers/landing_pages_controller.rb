class LandingPagesController < ApplicationController

  def show

    # data = {:headline => "Apple Pie", :subhead => "3.75"}
    page = LandingPage.find(params[:id])
    data = JSON.parse page.json
    render :json => data, :callback => params[:callback]
   
    
  end

end
