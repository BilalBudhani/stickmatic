require 'open-uri'
require "#{Rails.root}/lib/payzippy/config.rb"
require "#{Rails.root}/lib/payzippy/charging/charging_request.rb"


class ChargingController < ApplicationController
  include PZ_Config
  include ChargingRequest

  def charging_response
  end

  def charging_request

    @order = Order.find(params[:order_id])

    @address = @order.addresses.last

    initialize_merchant_config
    initialize_application_config
    initialize_extra_details
    @params = params
    @request_array = charge() #calculate hash, validate fields, assign URL, error_message.
  end



  def show
  end

  private

  def initialize_merchant_config
    # =======================================================
    # Mandatory parameters initialized by Merchant/ PZ_Config
    # =======================================================
    set_merchant_id(PZ_Config::MERCHANT_ID)
    set_merchant_key_id(PZ_Config::MERCHANT_KEY_ID)
    set_transaction_type(PZ_Config::TRANSACTION_TYPE)
    set_currency(PZ_Config::CURRENCY)
    set_ui_mode(PZ_Config::UI_MODE)
    set_hash_method(PZ_Config::HASH_METHOD)
    set_callback_url(PZ_Config::CALLBACK_URL)
    @charging_api_url = PZ_Config::API_BASE

  end

  def initialize_application_config
    # ==========================================================
    # Mandatory parameters need to be initialized by Application
    # ==========================================================
    set_buyer_email_address(current_user.email)
    set_merchant_transaction_id("ORDER"+@order.id.to_s) #FIXME ADDED ORDER
    set_transaction_amount(@order.calc_total_price)
    set_payment_method("PAYZIPPY")


  end


  def initialize_extra_details
    set_buyer_phone_no(@address.mobile) if @address.mobile?
    set_buyer_unique_id("BUYER"+current_user.id.to_s) if user_signed_in?
    set_shipping_address(@address.add1 + ", " + @address.add2)
    set_shipping_city(@address.city)
    set_shipping_state(@address.state)
    set_shipping_zip(@address.zipcode)
    set_shipping_country("India")

    # ==============================================
    # Optional parameters useful for fraud detection
    # ==============================================
    set_min_sla(4)
    set_is_user_logged_in(user_signed_in?)
    # set_address_count()
    # set_sales_channel(params[:sales_channel])
    set_item_total(@order.calc_qty.to_s)
    set_item_vertical("Magnets")
    set_sms_notify_number(@address.mobile) if @address.mobile?
  end

end
