if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY'] 
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Z1Z2vtMnpSRoTvCv9sngmfOx',
    :secret_key => 'sk_test_UzVj11Y0U5RcOpvvybMX9A3C'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
