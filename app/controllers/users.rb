get "/users/new" do
  @user = User.new
  erb :"users/new"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    erb :"session/login"
  else
    erb :"users/new"
  end
end

get "/users/:id" do
  if current_user
    erb :"users/show"
  else
    redirect to "session/login"
  end
end
