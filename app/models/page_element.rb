class PageElement < ActiveRecord::Base
  belongs_to :landing_page
  attr_accessible :label, :value, :landing_page_id
end
