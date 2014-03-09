ActiveAdmin.register Order do
  permit_params :user_id, :total_price, :status,:remark,:paid,,:ordered_packs_attributes=>[:pack_id, :qty,:total_price]

  controller do
    def new
      new!
      @order.ordered_packs.build 
    end 
  end


  form do |f|
    f.inputs "Order Details" do
      f.input  :user
      f.input  :total_price
      f.input  :status
      f.input  :remark
      f.input  :paid
      f.has_many :ordered_packs do |ordered_pack|
        ordered_pack.inputs "Ordered Packs" do
          ordered_pack.input :pack
          ordered_pack.input :qty
          ordered_pack.input :total_price
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