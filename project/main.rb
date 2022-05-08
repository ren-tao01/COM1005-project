 require "sinatra"
require "sequel"
require "logger"

# For Codio
set :bind, '0.0.0.0'

# So we can escape HTML special characters in the view
include ERB::Util

# Sessions
enable :sessions
set :session_secret, "E)H@McQfTjWnZr4u7x!A%D*G-KaNdRgU"

# Require main app files
require "require_all"
require_rel "databases/db", "controllers", "models"

get "/" do
    redirect "/signin" unless session[:logged_in]
    redirect "/homepage"
end