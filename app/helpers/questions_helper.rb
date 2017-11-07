module QuestionsHelper
	def unpaid_count
		a = @questions.size
		b = @questions.where(:paid =>  true).size
		a - b
	end
	
end