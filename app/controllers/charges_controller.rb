class ChargesController < ApplicationController
	before_action :authenticate_user!	
	before_action :set_profile

	def index
		@questions = Question.where(user_id: current_user.id)
	end


	def new
	end
	
	def create
		# Amount in cents
		@amount = 500
	  
		customer = Stripe::Customer.create(
		  :email => params[:stripeEmail],
		  :source  => params[:stripeToken]
		)
	  
		charge = Stripe::Charge.create(
		  :customer    => customer.id,
		  :amount      => @amount,
		  :description => 'Rails Stripe customer',
		  :currency    => 'aud'
		)
	  
		rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	private
			def set_profile
				@profile = Profile.find(current_user.id)
			end
end
