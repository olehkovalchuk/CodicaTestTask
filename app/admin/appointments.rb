ActiveAdmin.register Appointment do
  actions :index, :show

  index do
    selectable_column
    column :recommendation
    column :status
    column :doctor
    column :patient
    
    actions
  end

  filter :status, as: :select, collection: Appointment.statuses
  filter :doctor
  filter :patient

  show do
    attributes_table do
      row :recommendation
      row :status
      row :doctor
      row :patient
    end
  end
end
