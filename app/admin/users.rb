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

  show do |user|
    attributes_table do
      User.column_names.each do |col|
        if col == "image"
          row "Image" do
            image_tag(user.image)
          end
        else
          row col.to_sym
        end
      end
    end
  end

  filter :email
  filter :username
  filter :name
  filter :uid

end