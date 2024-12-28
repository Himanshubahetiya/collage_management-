ActiveAdmin.register Course do
  # Permit parameters to be passed for creation and editing
  permit_params :course_name

  # Index page configuration (list view)
  index do
    selectable_column
    id_column
    column :course_name
    # column :account_id

    actions
  end

  # Form configuration (for creating or editing accounts)
  form do |f|
    f.inputs do
      f.input :course_name
      # f.input :account_id
  
      
    end
    f.actions
  end

  # Filters configuration
  filter :course_name


end

