ActiveAdmin.register Character do

  permit_params :name, :rarity, :description, :element_id, :constellation, :image, :price


form do |f|
  f.semantic_errors
  f.inputs
  f.inputs do
    f.input :image, as: :file
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :element_id, :name, :rarity, :element_id_id, :constellation, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:element_id, :name, :rarity, :element_id_id, :constellation, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
end

