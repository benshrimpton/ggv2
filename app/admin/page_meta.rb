ActiveAdmin.register PageMeta do
  menu :parent => "Website"
  
  controller do
    def permitted_params
      params.permit!
    end
  end
end
