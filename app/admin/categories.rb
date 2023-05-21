ActiveAdmin.register Category do
  config.filters = false
  permit_params :name

  index do
    selectable_column
    column :name
    column :doctors
    
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :doctors
    end
  end
  
  controller do
    def destroy
      begin
        resource.destroy
        redirect_to admin_categories_path, notice: "Category successfully deleted!"
      rescue ActiveRecord::DeleteRestrictionError => e
        redirect_to resource_path(resource), alert: "This category has doctors. Please redefine the categories to the doctors before deleting" # can use e.message to get error from Rails or customise your message
      end
    end
  end
end
