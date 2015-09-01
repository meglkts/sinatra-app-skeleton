get '/login' do
  erb :'session/login'
end

post '/login' do
  @user=User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect '/lists'
  else
    erb :"session/login"
  end
end

get '/logout' do
  logout
  redirect to "/login"
end
