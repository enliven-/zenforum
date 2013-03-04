module ApplicationHelper

  def time_difference(date_2, date_1)
    time = ((date_2 - date_1) / 1.minute).round

    if time > 59
      time =((date_2 - date_1) / 1.hour).round

      if time > 23
        time =((date_2 - date_1) / 1.day).round
        coerce_time(time, 'day')
      else
      	coerce_time(time, 'hour')
      end

    else
      coerce_time(time, 'minute')
    end

  end

  private

  def coerce_time(time, string)
 
  	if time > 1
  		"#{time} #{string}s"
  	else
  		"#{time} #{string}"
  	end

  end

end
