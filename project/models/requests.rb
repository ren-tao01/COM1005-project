class Request < Sequel::Model
    #assign mentor id in the table when mentee sends first request
    def set_mentor_id(mentee_id, mentor_id)
        other_request = Request.first(mentee_id: mentee_id)
        other_request.mentor_id = mentor_id
        other_request.save_changes
        return nil
    end
    
    #set to 1 when mentor accepts request
    #set to 0 when mentee accepts after a meeting
    def set_mentor_status(mentee_id)
        other_request = Request.first(mentee_id: mentee_id)
        if other_request.mentor_status == 0 
            other_request.mentor_status = 1
        else
            other_request.mentor_status = 0
        end
        other_request.save_changes
        return nil
    end
    
    #set to 1 when mentee accepts after a meeting
    def set_mentee_status(mentee_id)
        other_request = Request.first(mentee_id: mentee_id)
        other_request.set_mentor_status(mentee_id)
        other_request.mentee_status = 1
        other_request.save_changes
        return nil
    end
    
    #clear request status for mentee if declined at any stage
    def clear(mentee_id)
        other_request = Request.first(mentee_id: mentee_id)
        other_request.mentor_id = 0
        other_request.mentor_status = 0
        other_request.mentee_status = 0
        other_request.save_changes
        #can do a notification thing here
        return nil
    end
    
    #create new record for each registered mentee
    def load(id)
        self.mentee_id = id
        self.mentor_id = 0
        self.mentor_status = 0
        self.mentee_status = 0
    end
    
end 