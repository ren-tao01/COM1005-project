get "/signupmentor" do
    erb:signupmentor
end

post "/signupmentor" do
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
    session[:description] = @user.get_description
    redirect "/homepage"
end
