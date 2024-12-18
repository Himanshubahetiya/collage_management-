ActiveAdmin.register Account do
  # Permit parameters to be passed for creation and editing
  permit_params :email, :password, :role_id, :name ,:dob 

  # Index page configuration (list view)
  index do
    selectable_column
    id_column
    column :email
    column :role
    column :name
    column :dob
    
    actions
  end

  # Form configuration (for creating or editing accounts)
  form do |f|
    f.inputs do
      f.input :email 
      f.input :password
      f.input :role, as: :select, collection: Role.all.map { |r| [r.name, r.id] }
      f.input :name
      f.input :dob
      
    end
    f.actions
  end

  # Filters configuration
  filter :email  
  filter :role
  filter :name
  filter :dob 
end

