module ApplicationHelper
    def format_time(time, format=:long, blank_message="&nbsp;")
        time.blank? ? blank_message : time.in_time_zone("Melbourne").strftime("%d %b %Y %H:%M")
    end

    def money(float)
        "$#{sprintf("%.2f", float)}"
    end    
end
