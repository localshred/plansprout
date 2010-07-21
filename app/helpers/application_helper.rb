# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def nice_time(old_time)
    val = Time.now - old_time
    if val < 10 then
      result = 'just a moment ago'
    elsif val < 60 then
      result = 'less than a minute ago'
    elsif val < 60 * 1.3  then
      result = "1 minute ago"
    elsif val < 60 * 50  then
      result = "#{(val / 60).to_i} minutes ago"
    elsif val < 60  * 60  * 2 then
      result = 'about 1 hour ago'
    elsif val < 60  * 60 * (24 / 1.02) then
      result = "about #{(val / 60 / 60 * 1.02).to_i} hours ago"
    else
      result = old_time.strftime("%H:%M %p %B %d, %Y")
    end
    result
  end
  
  def nl2br(string)
    string.gsub("\n\r","<br>").gsub("\r", "").gsub("\n", "<br />")
  end

end


