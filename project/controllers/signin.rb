get "/signin" do
    erb:signin
end

enable :sessions

post "/signin" do
    usrnm = params['username']
    @user = User.new
    @user.load(params)
    if @user.valid?
        if @user.exist?
            session[:logged_in] = true
            session[:user] = usrnm
            session[:first_name] = @user.get_first_name
            session[:surname] = @user.get_surname
            session[:email] = @user.get_email
            session[:id] = @user.get_id
            session[:gender] = @user.get_gender
            session[:university] = @user.get_university
            session[:description] = @user.get_description
            session[:role] = @user.get_role
            session[:name] = @user.get_name
            session[:status] = @user.get_status
            session[:request] = @user.get_request
            session[:field] = @user.get_field
        end
    end
    #TODO: add message if username/password is wrong
    redirect "/homepage"
end