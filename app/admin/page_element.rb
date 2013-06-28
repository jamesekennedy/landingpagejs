ActiveAdmin.register PageElement do

  belongs_to :landing_page
  index do
    column :label
    column :value
    default_actions
  end

end
