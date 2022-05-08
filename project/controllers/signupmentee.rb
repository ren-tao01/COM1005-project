get "/signupmentee" do

#ACCESSING Requests TABLE DATA
#    @requests = Request.all
#    @requests.each do |rec|
#       if rec.mentee_id == id youre looking for 
#            do whatever you want
#        end
#    end
    
    erb:signupmentee
end

post "/signupmentee" do
    @user = User.new
    @user.load(params)
    @user.save_changes
    session[:logged_in] = true
    session[:user] = @user.username
    session[:id] = @user.get_id
    session[:role] = @user.get_role
    session[:name] = @user.get_name
    session[:status] = @user.get_status
    session[:field] = @user.get_field
    @req = Request.new
    @req.load(@user.get_id)
    @req.save_changes
    redirect "/homepage"
end
