class LandingPage < ActiveRecord::Base
  attr_accessible :json, :description, :title
  has_many :page_elements
  validate :json_format

  protected

  def json_format
    errors[:base] << "not in json format" unless json.is_json?
  end
end
