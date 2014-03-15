ActiveAdmin.register User do
  config.clear_action_items!
  

  actions :all, :except => [:new,:destroy]

  index do 
    selectable_column
    id_column
    column :uid
    column :email
    column :username
    column :name
    column :credit
    column :created_at
    actions
  end

  filter :email
  filter :username
  filter :name
  filter :uid

end