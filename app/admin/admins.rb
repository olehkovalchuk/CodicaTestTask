ActiveAdmin.register Admin do
  permit_params :phone, :password, :password_confirmation

  index do
    selectable_column
    column :name
    column :phone
    actions
  end

  form do |f|
    f.inputs do
      f.input :phone
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
