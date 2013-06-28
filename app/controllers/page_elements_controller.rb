class PageElementsController < ApplicationController

  before_filter :load_landing_page
  def new
    @page_element = @landing_page.page_elements.new
  end

  def create


    @element = @landing_page.page_elements.new params[:page_element]
    if @element.save
      redirect_to landing_page_path(@landing_page)
    else
      render :new
    end
  end

  def update

    @page_element = @landing_page.page_elements.find params[:id]

    if @page_element.update_attributes params[:page_element]
      redirect_to landing_page_path(@landing_page)
    else
      render :edit
    end
  end

  def edit

    @page_element = @landing_page.page_elements.find params[:id]

  end

  def destroy
    if ( @landing_page.page_elements.exists? params[:id])
      @page_element = @landing_page.page_elements.find params[:id]      
      @page_element.destroy
    else
      flash[:notice]  = "Could not find the element to delete"
    end
    redirect_to landing_page_path(@landing_page)
  
  end

  protected

  def load_landing_page

    @landing_page = LandingPage.find params[:landing_page_id]
    
  end
end
