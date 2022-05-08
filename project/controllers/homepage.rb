get "/homepage" do
    redirect "/signin" unless session[:logged_in]
    @user = session[:user]
    
    if session[:role] == 2
        @abc = session[:id]
        @found = User.where(requested_to: session[:id])
        erb:homepage_mentor  
        
    elsif session[:role] == 0
        @users = User.all
        erb:homepage_admin
        
    else
        @available_mentors =
            User.where(Sequel.like(:pairing_status, 0)).where(role: 2).where(field: session[:field])
        erb:homepage_mentee
    end
    
end

#role: mentor=2 mentee=1 admin=0