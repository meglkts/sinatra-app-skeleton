
helpers do

  def current_user
    @current_user ||= User.find_by_id(session[:id])
  end

  	def logout
	  session.clear
	  @current_user = nil
	end
end
