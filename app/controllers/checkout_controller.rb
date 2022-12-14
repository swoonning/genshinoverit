class CheckoutController < ApplicationController
  def create

    @session = Stripe::Checkout::Session.create({

      customer: current_user.stripe_customer_id,
      customer_update: {
        address: 'auto',
      },
      success_url: root_url,
      cancel_url: root_url,
      payment_method_types: ['card'],
      line_items: @cart.collect {|item| item.to_builder.attributes!},
      automatic_tax: {
        enabled: true
      },
      mode: 'payment',
      billing_address_collection: 'required',

    }
  )
    respond_to do |format|
      format.js
    end
  end
end