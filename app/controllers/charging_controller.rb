require 'open-uri'
require "#{Rails.root}/lib/payzippy/config.rb"
require "#{Rails.root}/lib/payzippy/charging/charging_request.rb"
require "#{Rails.root}/lib/payzippy/charging/charging_response.rb"


class ChargingController < ApplicationController
  include PZ_Config
  include ChargingRequest
  include ChargingResponse

   skip_before_filter :verify_authenticity_token, only: [:charging_response]


  def charging_response
    # This file corresponds to your Charging Response Callback URL.

    @response_params = params
    # Incoming data can also be retrieved in the following manner using response_controller.rb or else in views we can display using @response_params array.
    @hash = validate()

# To check the validity of the response, call the validate function on
# the ChargingResponse object. It verifies the hash returned in the response.

    @transaction_status = get_transaction_status()
    @merchant_id = get_merchant_id
    @merchant_key_id = get_merchant_key_id
    @merchant_transaction_id = get_merchant_transaction_id
    @payzippy_transaction_id = get_payzippy_transaction_id
    @transaction_status = get_transaction_status
    @transaction_response_code = get_transaction_response_code
    @transaction_response_message = get_transaction_response_message
    @payment_method = get_payment_method
    @bank_name = get_bank_name
    @emi_months = get_emi_months
    @transaction_amount = get_transaction_amount
    @transaction_currency = get_transaction_currency
    @transaction_time = get_transaction_time
    @fraud_action = get_fraud_action
    @fraud_details = get_fraud_details
    @is_international= get_is_international
    @version = get_version
    @udf1 = get_udf1
    @udf2 = get_udf2
    @udf3 = get_udf3
    @udf4 = get_udf4
    @udf5 = get_udf5
    @hash_method = get_hash_method
    @hash = get_hash

  end

  def charging_request

    @order = Order.find(params[:order_id])

    @address = @order.addresses.last

    initialize_merchant_config
    initialize_application_config
    initialize_extra_details

    @request_array = charge() #calculate hash, validate fields, assign URL, error_message.

    @params = params
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
