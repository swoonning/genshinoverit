class CheckoutController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create({ customer: current_user.stripe_customer_id, customer_update: { address: "auto" }, success_url: "#{success_url}?session_id={CHECKOUT_SESSION_ID}", cancel_url: root_url, payment_method_types: ["card"], line_items: @cart.collect do |item|
                                                                                                                                                                                                                                                                       item.to_builder.attributes!
                                                                                                                                                                                                                                                                     end, automatic_tax: { enabled: true }, mode: "payment", billing_address_collection: "required" })
    respond_to do |format|
      format.js
    end
  end

  def success
    if params[:session_id].present?
      session[:cart] = []
      session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @elements = Element.all
      @order = Order.create(customer_belong: session.customer, stripe_order_id: session.payment_intent)

    else
      redirect_to index, alert: "Nothing"
    end
  end

  def failure; end
end
