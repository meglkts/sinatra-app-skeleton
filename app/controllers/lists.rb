get '/lists' do
	@lists = current_user.lists
	erb :"lists/index"
end

post '/lists' do
	list = List.new(params[:list])
	if list.save
		current_user.lists << list
		redirect to "/lists"
	else
		erb :"lists/new"
	end
end

get '/lists/new' do
	@list = List.new
	erb :'lists/new'
end

get '/lists/:id' do
	@list = List.find(params[:id])
	@completed = @list.completed_tasks
	@outstanding = @list.outstanding_tasks
	erb :"lists/show"
end

get '/lists/:list_id/tasks/new' do
	@task = Task.new
	@list = List.find(params[:list_id])
	erb :"tasks/new"
end

post '/lists/:list_id/tasks' do
	task = Task.new(params[:task])
	list = List.find(params[:list_id])
	if task.save
		list.tasks << task
		redirect to "/lists/#{params[:list_id]}"
	else
		erb :"tasks/new"
	end
end

delete '/lists/:list_id' do
	List.find(params[:list_id]).destroy
	redirect to "/lists"
end




