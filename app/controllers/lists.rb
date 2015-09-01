get '/lists' do
	@lists = current_user.lists
	erb :"lists/index"
end

get '/lists/new' do
	@list = List.new
	if request.xhr?
		erb :"lists/new", layout: false
	else
		erb :'lists/new'
	end
end

post '/lists' do
	list = current_user.lists.new(params[:list])
	if list.save
		if request.xhr?
			erb :"lists/_list_list", locals: { list: list }, layout: false
		else
			redirect to "/lists"
		end
	else
		erb :"lists/new"
	end
end

get '/lists/:list_id' do
	@list = current_user.lists.find(params[:list_id])
	@completed = @list.completed_tasks
	@outstanding = @list.outstanding_tasks
	erb :"lists/show"
end

get '/lists/:list_id/edit' do
	@list = current_user.lists.find(params[:list_id])
	erb :"lists/edit"
end

put '/lists/:list_id' do
	@list = current_user.lists.find(params[:list_id])
	@list.update(params[:list])
	redirect to "/lists/#{@list.id}"
end

delete '/lists/:list_id' do
	current_user.lists.find(params[:list_id]).destroy
	redirect to "/lists"
end




