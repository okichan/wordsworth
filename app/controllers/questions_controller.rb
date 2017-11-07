class QuestionsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :set_profile
	# before_action :amount_to_be_charged

	# GET /questions
	# GET /questions.json
	def index
		@user = current_user
		
		@q = Question.order(created_at: :desc).ransack(params[:q])
		@questions = @q.result(distinct: true)
		
	end

	def search
		index
		render :index
	end

	# GET /questions/1
	# GET /questions/1.json
	def show
		@answer = Answer.new unless @answer
	end	
	
	# GET /questions/new
	def new
		@user = current_user
		@question = Question.new
	end	
	
	# GET /questions/1/edit
	def edit
	end	
	
	def confirm
		@question = Question.new(question_params)
		unless @question.valid?
			render :action => :new
		  else       
		end
	end
	
	# POST /questions
	# POST /questions.json
	def create
		@user = current_user
		@question = Question.new(question_params)
		
		respond_to do |format|
			if @question.save
				format.html { redirect_to questions_path, notice: 'Question was successfully created.' }
				format.json { render :show, status: :created, location: @question }
			else
				format.html { render :new }
				format.json { render json: @question.errors, status: :unprocessable_entity, notice: 'yesy' }
			end	
		end	
	end	
	
	def thanks
		
	end
	
	# PATCH/PUT /questions/1
	# PATCH/PUT /questions/1.json
	def update
		respond_to do |format|
			if @question.update(question_params)
				format.html { redirect_to @question, notice: 'Question was successfully updated.' }
				format.json { render :show, status: :ok, location: @question }
			else
				format.html { render :edit }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end	
		end	
	end	

	# DELETE /questions/1
	# DELETE /questions/1.json
	def destroy
		@question.destroy
		respond_to do |format|
			format.html { redirect_to questions_url, notice: 'Question was successfully deleted.' }
			format.json { head :no_content }
		end	
	end	

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_question
			@question = Question.find(params[:id])
		end

		def set_user
			@user = current_user if signed_in?
		end

		def set_profile
			@profile = Profile.find(current_user.id) if current_user.present?
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def question_params
			params.require(:question).permit(:title, :text, :lang_from, :lang_to, :user_id, :price)
		end
end
