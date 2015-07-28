ActiveAdmin.register StoreLocation do
  menu :parent => "Website"
  permit_params :title, :body, :featured_image

  #this is the index of articles view
  index do
    selectable_column
    column :title
    column :body 
    column "Featured_Image" do |a|
      image_tag (a.featured_image.nil?) ? 'missing featured image' : a.featured_image.url(:thumb)
    end
    actions
  end

  #this is the edit form
  form do |f|
      f.inputs "Store Info" do
      f.input :title
      f.input :body
      f.input :featured_image, :as => :file, :hint => f.template.image_tag(f.object.featured_image.url(:thumb))
      # Will preview the image when the object is edited
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end


end
