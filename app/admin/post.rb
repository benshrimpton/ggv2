ActiveAdmin.register Post do
  menu :parent => "Website"
  actions :index, :show, :edit, :update, :new, :create, :destroy
  permit_params :title, :sub_title, :url_key, :body, :featured_image, :featured_image_vert, :journal_image, :journalimages

  #this is the index of articles view
  index do
    selectable_column
    column :title
    #column :body 
    column :body do |post|
      truncate(post.body, omision: "...", length: 200)
    end 
    column "Featured_Image" do |a|
      image_tag (a.featured_image.nil?) ? 'missing featured image' : a.featured_image.url(:thumb)
    end
    actions
  end

  #this is the edit form
  form do |f|
      f.inputs "Journal Post" do
      f.input :title
      f.input :sub_title
      f.input :url_key, :placeholder => "* optional"
      f.input :author
      f.input :body, input_html: { class: 'mceEditor' }
      f.input :featured_image, :as => :file, :hint => f.template.image_tag(f.object.featured_image.url(:thumb))
      f.input :featured_image_vert, :as => :file, :hint => f.template.image_tag(f.object.featured_image_vert.url(:thumb))
      f.has_many :journalimages, :label => "Journal Images" do |i|
        i.input :journal_image, :label => 'Image', :as => :file, :hint => i.template.image_tag(i.object.journal_image.url(:thumb))
        i.input :_destroy, :label => 'Delete this images?', :as => :boolean
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