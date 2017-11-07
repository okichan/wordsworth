module ApplicationHelper
    def full_title(page_title = '')
        base_title = 'Wordsworth'
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def format_time(time, format=:long, blank_message="&nbsp;")
        time.blank? ? blank_message : time.in_time_zone("Melbourne").strftime("%d %b %Y %H:%M")
    end

    def money(float)
        "$#{sprintf("%.2f", float)}"
    end    

    def check_avatar(user)
		if user.image_url.nil?
			'default_avatar.jpg'
		else
			user.image_url(:original)	
		end
	end

    def exclude_self
        User.where.not(id: current_user.id)
    end

    def leftright
        style='border: 2px dotted red;'
    end

    def testing(amount)
        amount = @question.text.length * 0.04
    end
end
