module ProfilesHelper
	def lowest_id(a, b)
		# if current_user.id is greater than recipient's id
		if a.to_i > b.to_i
			b
		else
			a
		end
	end

	def highest_id(a, b)
		if a.to_i > b.to_i
			a
		else
			b
		end
	end

end