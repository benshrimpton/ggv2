ActiveAdmin.register Collection, as: 'Collections' do
  menu :parent => "Website"

  index do
    selectable_column
    column :id
    column :name
    actions  
  end

  #This is the Edit Form For MULTIPLE Lookbook images
  form multipart: true do |f|
    f.inputs do
      f.input :name, :label => "Collection Title"
      f.input :video_id, :label => "Youtube ID"

      #loop the images fields
      f.has_many :lookbook_images, :label => "Lookbook Images" do |i|

        #first image
        i.input :lookbook_image, :label => 'Image 1', :as => :file, :hint => i.template.image_tag(i.object.lookbook_image.url(:thumb))
        i.input :title, :label => 'Look Title (eg: Look 1)'
        i.input :product_id, :label => 'Lookbook Product List'

        #Second image
        i.input :lookbook_image_1, :label => 'Image 2', :as => :file, :hint => i.template.image_tag(i.object.lookbook_image_1.url(:thumb))
        i.input :title_1, :label => 'Look Title (eg: Look 2)'
        i.input :product_id_1, :label => 'Lookbook Product List'

        i.input :_destroy, :label => 'Delete these two images?', :as => :boolean

      end
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
