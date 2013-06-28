class LandingPagesController < ApplicationController

  def show

    # data = {:headline => "Apple Pie", :subhead => "3.75"}
    

    respond_to do |format|
      format.html {
        @landinge_page = LandingPage.find params[:id]
        
      }
      format.json {
        if page = LandingPage.find(params[:id])
          elements = Hash.new

          page.page_elements.each do |element|
            elements.merge! element.to_json
          end

          data = elements
        else
          data = {}
        end
        render :json => data, :callback => params[:callback]

      }
  end   
    
  end

  def index

    @landinge_pages = LandingPage.all
    
  end


  def edit
    @landing_page = LandingPage.find params[:id]
    
  end

  def update

    @landing_page = LandingPage.find params[:id]

    if @landing_page.update_attributes params[:landing_page]
      redirect_to landing_pages_path
    else
      render :edit
    end
  end

end
