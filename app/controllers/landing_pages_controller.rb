class LandingPagesController < ApplicationController

  def show

    # data = {:headline => "Apple Pie", :subhead => "3.75"}
    

    respond_to do |format|
      format.html {
        @landing_page = LandingPage.find params[:id]
        
      }
      format.json {
        if params[:id] == "default"
          page = LandingPage.first
        else
          page = LandingPage.find(params[:id])
        end
        if page
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


  def new
    @landing_page = LandingPage.new
  end

  def duplicate

    original = LandingPage.find params[:id]

    copy = LandingPage.create :title => "#{original.title} - Copy", :description => "#{original.description}"
    
    original.page_elements.each do |page_element|
      copy.page_elements.create :label => page_element.label, :value => page_element.value
    end

    redirect_to landing_pages_path
    
  end

  def index

    @landinge_pages = LandingPage.all
    
  end


  def create

    @landing_page = LandingPage.new params[:landing_page]

    if @landing_page.save
      redirect_to landing_pages_path
    else
      render :new
    end
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

  def destroy

    @landing_page = LandingPage.find params[:id]
    @landing_page.destroy

    redirect_to landing_pages_path
  end


end
