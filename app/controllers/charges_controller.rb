class ChargesController < ApplicationController
	before_action :authenticate_user!	
	before_action :set_profile

	def index
		@questions = Question.where(user_id: current_user.id).order(paid: :desc, id: :desc) 
	end


	def new
		@question = Question.find(params[:id])
		@price = params[:price]
		session[:price] = @price
		session[:id] = @question.id

	end
	
	def create
		# Amount in cents
		@amount = (session[:price].to_f * 100).to_i
		@question_id = session[:id]
		tes = Question.find(@question_id)
		tes.paid = true
		tes.save

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

		session.delete(:price)
	end

	private
		def set_profile
			@profile = Profile.find(current_user.id)
		end
end
