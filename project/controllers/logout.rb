get "/logout" do
    @user = session[:name]
    session.clear
    erb:logout
end
