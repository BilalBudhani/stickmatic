ActiveAdmin.register User do
  config.clear_action_items!
  

  actions :all, :except => [:new,:destroy]

end