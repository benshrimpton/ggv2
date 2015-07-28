ActiveAdmin.register Page do
  menu parent: 'Website'
  permit_params :page_title, :url_key, :page_content, :order, :link_text

  filter :page_title
  filter :url_key
  filter :page_content

  #this is the index of articles view
  index do
    selectable_column
    column :order
    column :page_title
    column :url_key
    actions
  end

  #this is the edit form
  form multipart: true do |f|
    f.inputs do
      f.input :page_title, label: 'Page Name'
      f.input :order
      f.input :link_text
      f.input :url_key, label: 'Page Url'
      f.input :page_content, input_html: { class: 'mceEditor' }
    end

    f.actions
  end

end