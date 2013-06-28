class AddJsonToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :json, :text
  end
end
