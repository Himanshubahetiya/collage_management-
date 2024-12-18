ActiveAdmin.register Role do
  # Permit parameters to be passed for creation and editing
  permit_params :name

  # Index page configuration (list view)
  index do
    selectable_column
    id_column
    column :name
    actions
  end

  # Form configuration (for creating or editing accounts)
  form do |f|
    f.inputs do
      f.input :name
      
    end
    f.actions
  end

  # Filters configuration
  filter :name
end

