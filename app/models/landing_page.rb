class LandingPage < ActiveRecord::Base
  attr_accessible :json, :description, :title
  has_many :page_elements
 


  def to_param

    "#{id}-#{title.parameterize}"
    
  end


 
end
