ActiveAdmin.register LandingPage do

  index do
    column :id
    column :title
    column :description
    default_actions
  end

  
  show do |ad|
    attributes_table do
      row :to_param, :label => "Landing Page ID"
      row :title
      row :description  
      row :page_elements
      row :json
    end


  end
  filter :title





end
