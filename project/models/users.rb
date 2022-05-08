class User < Sequel::Model
    
    def self.id_exists?(id)
        return false if id.nil?
    end
    
    def exist?
        other_user = User.first(username: username)
        !other_user.nil? && other_user.password = password
        #returning password
    end
    
    def validate_email_address(email_address)
        email_address =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end

  
    def get_id
        other_user = User.first(username: username)
        return other_user.id
    end
    
    def get_role
        other_user = User.first(username: username)
        return other_user.role
    end
    
    def get_name
        other_user = User.first(username: username)
        firstN = "#{other_user.first_name}"
        surN = "#{other_user.surname}"
        if(firstN.length >= 1 && surN.length >= 1) then      
          name = "#{other_user.first_name} #{other_user.surname}"
        else
          name = "#{other_user.first_name}"
        end
        return name
    end
        
    def get_first_name
        other_user = User.first(username: username)
        return other_user.first_name
    end
        
    def get_surname
        other_user = User.first(username: username)
        return other_user.surname
    end
        
    def get_email
        other_user = User.first(username: username)
        return other_user.email
    end
        
    def get_gender
        other_user = User.first(username: username)
        return other_user.gender
    end
        
    def get_university
        other_user = User.first(username: username)
        return other_user.university
    end
        
    def get_description
        other_user = User.first(username: username)
        return other_user.description
    end
    
    def get_status
        other_user = User.first(username: username)
        return other_user.pairing_status
    end
    
    def get_request
        other_user = User.first(username: username)
        return other_user.outgoing_request
    end
    
    def get_field
        other_user = User.first(username: username)
        return other_user.field
    end
    
    def change_request_status_toOne
        other_user = User.first(username: username)
        other_user.outgoing_request = 1
        other_user.save_changes
        return nil
    end
    
    def change_request_status_toZero
        other_user = User.first(username: username)
        other_user.outgoing_request = 0
        other_user.save_changes
        return nil
        end
                
    def set_username(newusername)
        other_user = User.first(username: username)
        other_user.username = newusername
        other_user.save_changes
        return nil
    end
    
    def set_password(newpassword)
        if newpassword.length() > 0
            other_user = User.first(username: username)
            other_user.password = newpassword
            other_user.save_changes
        end
        return nil
    end
        
    def set_email(newemail)
        other_user = User.first(username: username)
        other_user.email = newemail
        other_user.save_changes
        return nil
    end
        
    def set_field(newfield)
        other_user = User.first(username: username)
        other_user.field = newfield
        other_user.save_changes
        return nil
    end
        
    def set_description(newdescription)
        other_user = User.first(username: username)
        other_user.description = newdescription
        other_user.save_changes
        return nil
    end
        
    def set_university(newuniversity)
        other_user = User.first(username: username)
        other_user.university = newuniversity
        other_user.save_changes
        return nil
    end
        
    def generate_random_string
        return SecureRandom.alphanumerical(32)
    end
    
        
    # TODO: fix these methods to fit with "requests" table in db
    def set_requested_to(number)
        other_user = User.first(username: username)
        other_user.requested_to = number
        other_user.save_changes
        return nil
    end
  
    def set_requested_toZero
        other_user = User.first(username: username)
        other_user.requested_to = 0
        other_user.save_changes
        
        return nil
    end

    #adding data to the database
    def load(params)
        self.username = params.fetch("username", "").strip
        self.password = params.fetch("password", "").strip
        self.role = params.fetch("role", "").strip
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.email = params.fetch("email", "").strip
        self.gender = params.fetch("gender", "").strip
        self.field = params.fetch("field", "").strip
        # self.rating = 0
        self.pairing_status = 0
        self.outgoing_request = 0
        self.requested_to = 0
    end
        
    def name
        "#{first_name} #{surname}"
    end
end
