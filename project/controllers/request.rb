get "/request" do
  id = params["id"]
  @name = params["name"]
  
  # TODO: change outgoing request status 
  # (implement function in users model)
  currentUser = User[session[:id]]
  currentUser.change_request_status_toOne
  currentUser.set_requested_to(id)
  #erb :request
    redirect "/homepage"
end

get "/cancelrequest" do
  id = params["id"]
  @name = params["name"]
  # TODO: change outgoing request status 
  # (implement function in users model)
  currentUser = User[session[:id]]
  currentUser.change_request_status_toZero
  currentUser.set_requested_toZero
  #erb :cancelrequest
    redirect "/homepage"
end