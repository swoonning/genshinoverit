ActiveAdmin.register Element do

  permit_params :element

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :element
  #
  # or
  #
  # permit_params do
  #   permitted = [:element]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
