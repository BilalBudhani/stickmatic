ActiveAdmin.register Order do
  permit_params :user_id, :total_price, :status, :remark, :paid,
                ordered_packs_attributes: [:pack_id, :qty, :total_price]

  config.clear_action_items!



  action_item only: [:show] do
    link_to 'Print', print_admin_order_path(order), method: :post
  end

  batch_action :print do |selection|

  end

  member_action :print, :method => :post do
    order = Order.find(params[:id])

    redirect_to order.download_pdf!
  end

  actions :all, :except => [:new,:destroy]

  controller do
    def new
      new!
      @order.ordered_packs.build
    end
  end

  filter :paid
  filter :created_at
  filter :total_price

  index do
     Order.column_names.each do |col|
       column col.to_sym
     end

      actions defaults: true do |order|
        link_to "Print", print_admin_order_path(order), method: :post ,class: "member_link"
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