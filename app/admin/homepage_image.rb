ActiveAdmin.register HomepageImage, as: 'Rollover Images' do
  menu parent: 'Home Images'

  index do
    selectable_column
    column :id
    column :menu_name
    column "Desktop Image" do |a|
      image_tag (a.image_desktop.nil?) ? 'missing desktop image' : a.image_desktop.url(:thumb)
    end
    column "Mobile Image" do |a|
      image_tag (a.image_mobile.nil?) ? 'missing featured image' : a.image_mobile.url(:thumb)
    end
    actions
  end

  #this is the edit form
  form multipart: true do |f|
    f.inputs do
      f.input :menu_name, as: :select, collection: ['shop', 'collections', 'journal', 'store', 'account']
      f.input :image_desktop, :label => 'Homepage Desktop Image', :as => :file, :hint => f.template.image_tag(f.object.image_desktop.url(:thumb))
      f.input :image_mobile, :label => 'Homepage Mobile Image', :as => :file, :hint => f.template.image_tag(f.object.image_mobile.url(:thumb))
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end