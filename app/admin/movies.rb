ActiveAdmin.register Movie do
  permit_params :name, :description, :director, :producer, :released_date, :image

  form do |f|
    f.inputs "Club" do
      f.input :name
      f.input :description
      f.input :director
      f.input :producer
      f.input :released_date
      f.input :image, :as => :file
    end
    f.actions
  end
end