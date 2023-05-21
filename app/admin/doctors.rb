ActiveAdmin.register Doctor do
  permit_params :phone, :name, :category_id, :password, :password_confirmation

  index do
    selectable_column
    column :name
    column :phone
    column :category
    column 'open_appointments' do |doctor|
      doctor.appointments.open.count
    end
    column 'closed_appointments' do |doctor|
      doctor.appointments.closed.count
    end
    
    actions
  end

  filter :category

  form do |f|
    f.inputs do
      f.input :phone
      f.input :name
      f.input :category
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :phone
      row :category 
      row 'open_appointments' do |doctor|
        doctor.appointments.open
      end
      row 'closed_appointments' do |doctor|
        doctor.appointments.closed
      end
    end
  end

  controller do
    def update
      if params[:doctor][:password].blank?
        params[:doctor].delete "password"
        params[:doctor].delete "password_confirmation"
      end

      super
    end
  end

end
