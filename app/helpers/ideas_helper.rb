module IdeasHelper
  
  def time_and_creator(obj)
    action = "Created"
    time_ago = nice_time obj.created_at
    if obj.created_at < obj.updated_at
      action = "Updated"
      time_ago = nice_time obj.updated_at
    end

    creator = obj.user.name
    if creator = current_user.name
      creator = "Me"
    end
    
    action+" "+time_ago+" by "+creator
  end # def who_created
  
end
