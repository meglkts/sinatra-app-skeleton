get '/' do
	if current_user
    redirect to "/lists"
	else
  	erb :'session/login'
  end
end

