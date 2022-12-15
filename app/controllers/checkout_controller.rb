class CheckoutController < ApplicationController
  def create

    @session = Stripe::Checkout::Session.create({

      customer: current_user.stripe_customer_id,
      customer_update: {
        address: 'auto',
      },
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
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

  def success
    if params[:session_id].present?
      session = Stripe::Checkout::Session.retrieve(params[:session_id])
      session[:cart] = []
      @elements = Element.all
      @order = Order.create(customer_belong: session.customer, stripe_order_id: session.payment_intent)
      session_with_expand = Stripe::Checkout::Session.retrieve({
        id: params[:session_id],
        expand: ["line_items"]
      })
      session_with_expand.line_items.data.each do |line_item|
        character = Character.find_by(stripe_product_id: line_item.price.product)
    end
  else
    redirect_to index, alert: "Nothing"
    end
  end

  def failure

  end
end