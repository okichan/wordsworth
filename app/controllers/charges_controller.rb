class ChargesController < ApplicationController
	before_action :authenticate_user!	
	before_action :amount_to_be_charged
	before_action :set_profile

	def index
		@questions = Question.where(user_id: current_user.id)
	end


	def new
	end
	
	def create
	
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
			def amount_to_be_charged
				a = Question.find(id=7)
				@amount = (a.price * 100).to_i
			end

			def set_profile
				@profile = Profile.find(current_user.id) if signed_in?
			end
end
