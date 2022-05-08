get "/pending" do
    @abc = session[:id]
    @found = User.where(requested_to: session[:id])
    erb:pending
end