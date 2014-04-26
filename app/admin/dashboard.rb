ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    #   div class: "blank_slate_container", id: "dashboard_default_message" do
    #     span class: "blank_slate" do
    #       span I18n.t("active_admin.dashboard_welcome.welcome")
    #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #     end
    #   end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Users" do
          table do
            th "Id"
            th "Name"
            th "Paid Orders"
            th "Unpaid Orders"

            User.last(5).map do |user|
              tr do
                td link_to(user.id, admin_user_path(user))
                td link_to(user.name, admin_user_path(user))
                td Order.paid(user).count
                td Order.unpaid(user).count
              end
            end
          end
        end
      end


      column do
        panel "Recent Orders" do
          table do
            th "Id"
            th "Order By"
            th "Pack Size"
            th "Paid"


            Order.last(5).map do |order|
              tr do
                td link_to(order.id, admin_order_path(order))
                td link_to(order.user.name, admin_user_path(order.user))
                td order.packs_count
                td order.paid? ? "yes" : "no"
              end
            end
          end
        end
      end

      # column do
      #   panel "Recent Orders" do
      #     ul do
      #       Order.last(5).map do |order|
      #         li link_to(order.id, admin_order_path(order))
      #       end
      #     end
      #   end
      # end
    end
  end # content
end
