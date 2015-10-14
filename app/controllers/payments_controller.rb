class PaymentsController < ApplicationController

def create
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price * 100).to_i, # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
    )

     if charge.paid == true
      @order = Order.create(product_id: @product.id, total: @product.price, user_id: @user.id)
      @order.save
      UserMailer.order_confirmation(@user).deliver
      redirect_to product_path(order)
    end

  rescue Stripe::CardError => e
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
end

end
