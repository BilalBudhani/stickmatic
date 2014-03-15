ActiveAdmin.register Pack do
  permit_params :user, :name, :price,:pack_items_attributes=>[:pack_id, :uid,:image,:thumb]

  controller do
    def new
      new!
      @order.ordered_packs.build 
    end 
  end


  form do |f|
    f.inputs "Pack Details" do
      f.input  :user
      f.input  :name
      f.input  :price
      f.has_many :ordered_packs do |ordered_pack|
        ordered_pack.inputs "Packs Items" do
          ordered_pack.input :uid
          ordered_pack.input :image
          ordered_pack.input :thumb
          ordered_pack.input :pack
          if !ordered_pack.object.nil?
            # show the destroy checkbox only if it is an existing appointment
            # else, there's already dynamic JS to add / remove new appointments
            ordered_pack.input :_destroy, :as => :boolean, :label => "Destroy?"
          end
        end
      end     
    end
    f.actions
  end
end