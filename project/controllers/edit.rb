get "/edit" do
    @user = session[:user]
    
    if session[:role] == 2
        @found = User.where(requested_to: session[:id])
        erb:edit_mentor
        
    elsif session[:role] == 1
        @user = session[:user]
        erb:edit_mentee
        
    else
        @user = session[:user]
        erb:edit_admin
    end
    
end

post "/edit" do
    @user = session[:user]
    currentuser = User[session[:id]]
    if params["username"].length() > 0
        currentuser.set_username(params["username"])
    end
    currentuser.set_password(params["password"])
    if currentuser.validate_email_address(params["email"])
        currentuser.set_email(params["email"])
    end
    currentuser.set_field(params["field"])
    if session[:role] == 2
        if params["description"].length() > 0
            currentuser.set_description(params["description"])
        end
    else 
        if params["university"].length() > 0
            currentuser.set_university(params["university"])
        end
    end
    redirect "/homepage"
end
