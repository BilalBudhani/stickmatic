module PZ_Config

  MERCHANT_ID = "test_t1034" # Your Merchant ID
  SECRET_KEY = "cc1adc1d5f03aaad9be4a3f53d6ad97476df616f142f6b5d929c832318398c00" # Your Secret Key. Do not share this.
  TRANSACTION_TYPE = "SALE"
  CURRENCY = "INR"
  UI_MODE = "REDIRECT" # UI Integration - REDIRECT or IFRAME
  HASH_METHOD = "SHA256" # MD5 or SHA256
  MERCHANT_KEY_ID = "payment" # Your Merchant Key ID
  CALLBACK_URL = "http://#{Rails.application.config.action_mailer.default_url_options[:host]}/charging/charging_response" # Your callback URL

  API_BASE = "https://www.payzippy.com/payment/api/"
  API_CHARGING = "charging"
  API_QUERY = "query"
  API_REFUND = "refund"
  API_VERSION = "v1"
  VERIFY_SSL_CERTS = true

end
