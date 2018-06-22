ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :fullname
    form do |f|
    f.inputs "User" do
      f.input :fullname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end