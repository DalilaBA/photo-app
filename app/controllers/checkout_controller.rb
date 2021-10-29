class CheckoutController < ApplicationController
  
  def create
    
    plan = Plan.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      line_items: [{
          name: plan.name,
          amount: plan.price,
          currency: 'usd',
          quantity: 1
      }],
      payment_method_types: [
        'card',
      ],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })
   
    respond_to do |format|
      
      format.js
    end
  end
end
