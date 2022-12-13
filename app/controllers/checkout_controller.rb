class CheckoutController < ApplicationController
  def create
    character = Character.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      success_url: root_url,
      cancel_url: root_url,
      line_items: [{
        # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
        price_data: {
          currency: "cad",
          unit_amount: character.price,
          product_data: {
            name: character.name,
          }
        },
        quantity: 1,
      }],
      mode: 'payment',

    })
    respond_to do |format|
      format.js
    end
  end
end