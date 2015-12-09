class ChargesController < ApplicationController

  before_action :authenticate_user!
  def new
    @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "Blocipedia Membership - #{current_user.name}",
    amount: 30_00
     }
  end


  def create
   
   @amount = 30_00
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   charge = Stripe::Charge.create(
     customer: customer.id, 
     amount: @amount,
     description: "Blocipedia upgrade account",
     currency: 'usd'
   )
    
   # current_user.role ='premium'
   # current_user.save
   current_user.update_attribute(:role, "premium")
   
   flash[:success] = "Thanks for all the money, #{current_user.name}! Feel free to spend your money in blocipedia website."
   redirect_to wikis_path
 
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end
