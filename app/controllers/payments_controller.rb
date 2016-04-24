class PaymentsController < ApplicationController

def create
  token = params[:stripeToken]
 # byebug
  @product = Product.find(params[:product_id])
  @user = current_user
  @color = Color.find(params[:color_id])
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price * 100), # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
    )

     if charge.paid == true
      @order = Order.create(product_id: @product.id, total: @product.price, user_id: @user.id, color_id: @color.id)
      @order.save
      UserMailer.mail_confirmation(@user, 'The order has been received!', @order).deliver
      redirect_to @order
    end

  rescue Stripe::CardError => e
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
end

end
