class LandingPagesController < ApplicationController

  def show

    # data = {:headline => "Apple Pie", :subhead => "3.75"}
    
    if page = LandingPage.find(params[:id])
      data = JSON.parse page.json
    else
      data = {}
    end
    render :json => data, :callback => params[:callback]
   
    
  end

end
